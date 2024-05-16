import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/core/util/util.dart';
import 'package:hebauto/features_customer/dashboard/presentation/bloc/dashboard_bloc.dart';

import '../../../../core/components/dx_text.dart';
import '../../../inventory/presentation/bloc/inventory_bloc.dart';
import '../../../inventory/presentation/bloc/inventory_event.dart';
import '../bloc/dashboard_events.dart';
import '../widgets/calender_widget.dart';
import '../widgets/inventory_stats_widget.dart';
import '../widgets/recent_history_widget.dart';
import '../widgets/store_locator_widget.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  @override
  void initState() {
    super.initState();
    context.read<CustomerDashboardBloc>().add(DashboardStatsEvent());

    context.read<CustomerInventoryBloc>().add(FetchInventoryEvent(page: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.isPhone() ?const EdgeInsets.symmetric(horizontal: 10):  const EdgeInsets.symmetric(horizontal: 30),
      child: context.isPhone()
          ? SingleChildScrollView(
              child: Column(
                children: [



                  defaultWidgetsVerticalSpacing,

                  if (context.isPhone()) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DxText(
                        isMobileHeading: true,
                        text: 'Dashboard',
                        size: 15,
                        isBold: true,
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<CustomerInventoryBloc>()
                              .add(FetchInventoryEvent());
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ) else const SizedBox.shrink(),
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,

                  const InventoryStatsWidget(),

                  20.height,

                  const CalenderWidget(isMobile: true,),


                  20.height,

                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,

                  //const RecentInventoryWidget(),
                  const SizedBox(height: 400, child: StoreLocatorWidget())
                ],
              ),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                  Row(
                    children: [
                      const InventoryStatsWidget().expand(),
                      20.width,
                      const CalenderWidget().expand(),
                    ],
                  ),
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                  Row(
                    children: [
                      //const StoreLocatorWidget().expand(),
                      const SizedBox(height: 370, child: StoreLocatorWidget(),).expand(),
                      20.width,
                      const RecentInventoryWidget().expand(flex: 2)
                    ],
                  ),
                  defaultWidgetsVerticalSpacing,
                ],
              ),
          ),
    );
  }
}
