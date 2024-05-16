import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/constants.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_customer/inventory/domain/entity/inventory_entity_customer.dart';

import '../../../../core/util/config.dart';
import '../../../../core/util/decorations.dart';
import '../../../inventory/presentation/bloc/inventory_bloc.dart';
import '../../../inventory/presentation/bloc/inventory_event.dart';
import '../../../inventory/presentation/bloc/inventory_state.dart';
import 'dashboard_recent_history_list_item.dart';

class RecentInventoryWidget extends StatefulWidget {
  const RecentInventoryWidget({
    super.key,
  });

  @override
  State<RecentInventoryWidget> createState() => _RecentInventoryWidgetState();
}

class _RecentInventoryWidgetState extends State<RecentInventoryWidget>
    with TickerProviderStateMixin {
  static final cc = Colors.grey.withOpacity(0.2);
  static final dd = Colors.grey.withOpacity(0.5);

  String itemStatus(ItemEntityCustomer item) {
    if (item.warehouse?.pickedDate != null) {
      return 'Delivered';
    }
    if (item.shipping?.shippingDate != null &&
        item.warehouse?.arrivalDate == null) {
      return 'Shipping';
    }

    if (item.towing?.warehouseDeliveryDate != null &&
        item.shipping?.shippingDate == null) {
      return 'Warehouse';
    }
    if (item.towing?.towingDate != null &&
        item.towing?.warehouseDeliveryDate == null &&
        item.shipping?.shippingDate == null) {
      return 'Towing';
    }

    return 'New Created';
  }

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 5, vsync: this);
    return Container(
      height: 370,
      padding: const EdgeInsets.only(left: 20),
      decoration: boxDecorationRoundedWithShadow(
        defaultItemsRadius.toInt(),
        //backgroundColor: greenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTabController(
                length: 5,
                child: ButtonsTabBar(
                  controller: tabController,
                  backgroundColor: kPrimaryColor,
                  labelSpacing: 10,
                  buttonMargin: const EdgeInsets.only(right: 30),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(text: 'Recently Added'),
                    Tab(text: 'On Towing'),
                    Tab(text: 'Warehouse'),
                    Tab(text: 'On transit'),
                    Tab(text: 'Delivered'),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<CustomerInventoryBloc>()
                      .add(FetchInventoryEvent(page: 1));
                },
                icon: Icon(
                  Icons.refresh,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          DashboardRecentHistoryListItem(
            color: Colors.grey[300] ?? Colors.grey,
            vinNumber: 'Vin Number',
            carDetails: 'Car Details',
            departurePort: 'Departure Port',
            deliveryPort: 'Delivery Port',
            state: 'State',
          ),
          15.height,
          BlocBuilder<CustomerInventoryBloc, CustomerInventoryState>(
            builder: (context, state) {
              //print('${state}');
              if (state.status.isLoading) {
                return const Align(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status.isError) {
                return Center(child: Text(state.message));
              } else if (state.status.isSuccess) {
                return TabBarView(controller: tabController, children: [
                  Center(
                    child: state.data.isNotEmpty
                        ? Column(
                            children:
                                state.data.take(3).toList().asMap().entries.map(
                              (item) {
                                final e = item.value;
                                return DashboardRecentHistoryListItem(
                                  vinNumber: e.vehicle?.vinNumber ?? '',
                                  carDetails: e.vehicle?.name ?? '',
                                  departurePort: e.towing?.departurePort ?? '',
                                  deliveryPort:
                                      e.shipping?.offLoadingPort ?? '',
                                  state: itemStatus(e),
                                  color: item.key % 2 == 0 ? dd : cc,
                                );
                              },
                            ).toList(),
                          )
                        : const Center(
                            child: Text('No inventory yet'),
                          ),
                  ),
                  Center(
                    child: state.data
                            .where((element) => (element.towing?.towingDate !=
                                    null &&
                                element.towing?.warehouseDeliveryDate == null &&
                                element.shipping?.shippingDate == null))
                            .isNotEmpty
                        ? Column(
                            children: state.data
                                .where((element) =>
                                    (element.towing?.towingDate != null &&
                                        element.towing?.warehouseDeliveryDate ==
                                            null &&
                                        element.shipping?.shippingDate == null))
                                .take(3)
                                .toList()
                                .asMap()
                                .entries
                                .map(
                              (item) {
                                final e = item.value;
                                return DashboardRecentHistoryListItem(
                                  vinNumber: e.vehicle?.vinNumber ?? '',
                                  carDetails: e.vehicle?.name ?? '',
                                  departurePort: e.towing?.departurePort ?? '',
                                  deliveryPort:
                                      e.shipping?.offLoadingPort ?? '',
                                  state: 'Towing',
                                  color: item.key % 2 == 0 ? dd : cc,
                                );
                              },
                            ).toList(),
                          )
                        : const Center(
                            child: Text('No item in towing yet'),
                          ),
                  ),
                  Center(
                    child: state.data
                            .where((element) =>
                                (element.towing?.warehouseDeliveryDate !=
                                        null &&
                                    element.shipping?.shippingDate == null))
                            .isNotEmpty
                        ? Column(
                            children: state.data
                                .where((element) =>
                                    (element.towing?.warehouseDeliveryDate !=
                                            null &&
                                        element.shipping?.shippingDate == null))
                                .take(3)
                                .toList()
                                .asMap()
                                .entries
                                .map(
                              (item) {
                                final e = item.value;
                                return DashboardRecentHistoryListItem(
                                  vinNumber: e.vehicle?.vinNumber ?? '',
                                  carDetails: e.vehicle?.name ?? '',
                                  departurePort: e.towing?.departurePort ?? '',
                                  deliveryPort:
                                      e.shipping?.offLoadingPort ?? '',
                                  state: 'Warehouse',
                                  color: item.key % 2 == 0 ? dd : cc,
                                );
                              },
                            ).toList(),
                          )
                        : const Center(
                            child: Text('No item is in warehouse yet'),
                          ),
                  ),
                  Center(
                    child: state.data
                            .where((element) =>
                                (element.shipping?.shippingDate != null &&
                                    element.warehouse?.arrivalDate == null))
                            .isNotEmpty
                        ? Column(
                            children: state.data
                                .where((element) =>
                                    (element.shipping?.shippingDate != null &&
                                        element.warehouse?.arrivalDate == null))
                                .take(3)
                                .toList()
                                .asMap()
                                .entries
                                .map(
                              (item) {
                                final e = item.value;
                                return DashboardRecentHistoryListItem(
                                  vinNumber: e.vehicle?.vinNumber ?? '',
                                  carDetails: e.vehicle?.name ?? '',
                                  departurePort: e.towing?.departurePort ?? '',
                                  deliveryPort:
                                      e.shipping?.offLoadingPort ?? '',
                                  state: 'Shipping',
                                  color: item.key % 2 == 0 ? dd : cc,
                                );
                              },
                            ).toList(),
                          )
                        : const Center(
                            child: Text('No item is in shipping yet'),
                          ),
                  ),
                  Center(
                    child: state.data
                            .where((element) =>
                                (element.warehouse?.pickedDate != null))
                            .isNotEmpty
                        ? Column(
                            children: state.data
                                .where((element) =>
                                    (element.warehouse?.pickedDate == null))
                                .take(3)
                                .toList()
                                .asMap()
                                .entries
                                .map(
                              (item) {
                                final e = item.value;
                                return DashboardRecentHistoryListItem(
                                  vinNumber: e.vehicle?.vinNumber ?? '',
                                  carDetails: e.vehicle?.name ?? '',
                                  departurePort: e.towing?.departurePort ?? '',
                                  deliveryPort:
                                      e.shipping?.offLoadingPort ?? '',
                                  state: 'Delivered',
                                  color: item.key % 2 == 0 ? dd : cc,
                                );
                              },
                            ).toList(),
                          )
                        : const Center(
                            child: Text('No item is delivered yet'),
                          ),
                  ),
                ]).expand();
              }
              return Center(child: Text(state.message));
            },
          ),
        ],
      ),
    );
  }
}
