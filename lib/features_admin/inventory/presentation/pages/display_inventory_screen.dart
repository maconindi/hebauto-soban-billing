import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/components/fd_button.dart';

import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../../core/components/dx_dropdown_search.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/components/dx_inventory_table.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

class DisplayInventoryScreen extends StatefulWidget {
  static const String displayInventoryScreen = 'displayInventoryScreen';

  const DisplayInventoryScreen({super.key});

  @override
  State<DisplayInventoryScreen> createState() => _DisplayInventoryScreenState();
}

class _DisplayInventoryScreenState extends State<DisplayInventoryScreen> {
  //late InventoryDataGrid _inventoryDataGrid;

  @override
  void initState() {
    super.initState();

    //context.read<InventoryBloc>().add(FetchInventoryEvent());

    context.read<InventoryBloc>().add(FetchInventoryEvent(
        page: 1, screen: DisplayInventoryScreen.displayInventoryScreen));
    //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());

    // Call the method to fetch data when the screen is first initialized
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to fetch data every time the route changes
    if (ModalRoute.of(context)?.isCurrent == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(),
      child: Column(
        children: [
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          const DxText(
            text: 'Inventory Items',
            isBold: true,
            size: 30,
            color: black,
          ),
          SizedBox(
            width: context.width() / 2,
            child: Row(
              children: [
                DropDownSearchWidget(
                  callback: (type, args) {
                    if (args.isNotEmpty) {
                      context.read<InventoryBloc>().add(SearchInventoryEvent(
                          page: 1, args: args, category: type));
                    } else {
                      context.read<InventoryBloc>().add(FetchInventoryEvent(
                          page: 1,
                          screen:
                              DisplayInventoryScreen.displayInventoryScreen));
                    }
                  },
                ).expand(),

                5.width,
                FDButton(
                  child: Row(children: [

                    const Icon(Icons.refresh_rounded,color: whiteColor,),
                    10.width,
                    const Text('Refresh List', style: TextStyle(color: whiteColor),)

                  ],),
                  onTap: () {
                    context.read<InventoryBloc>().add(FetchInventoryEvent(
                        screen: DisplayInventoryScreen.displayInventoryScreen));
                  },
                  //text: 'Refresh List',
                )
              ],
            ),
          ),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Align(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status.isError) {
                return Text(state.message);
              } else if (state.status.isSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DxInventoryTable(list: state.data),
                      defaultWidgetsVerticalSpacing,
                      defaultWidgetsVerticalSpacing,
                      NumberPagination(
                        onPageChanged: (int pageNumber) {},
                        threshold: 2,
                        colorPrimary: kPrimaryColor,
                        pageTotal: state.lastPage,
                        pageInit: state.currentPage,
                        iconNext: IconButton(
                          onPressed: () {
                            if (state.lastPage != state.currentPage) {
                              context.read<InventoryBloc>().add(
                                  FetchInventoryEvent(
                                      page: state.currentPage + 1,
                                      screen: DisplayInventoryScreen
                                          .displayInventoryScreen));
                            }
                          },
                          icon: const Icon(Icons.navigate_next),
                        ),
                        iconPrevious: IconButton(
                          onPressed: () {
                            if (1 != state.currentPage) {
                              context.read<InventoryBloc>().add(
                                  FetchInventoryEvent(
                                      page: state.currentPage - 1,
                                      screen: DisplayInventoryScreen
                                          .displayInventoryScreen));
                            }
                          },
                          icon: const Icon(Icons.navigate_before),
                        ),
                        iconToFirst: IconButton(
                          onPressed: () {
                            context.read<InventoryBloc>().add(
                                FetchInventoryEvent(
                                    page: 1,
                                    screen: DisplayInventoryScreen
                                        .displayInventoryScreen));
                          },
                          icon: const Icon(Icons.skip_previous_outlined),
                        ),
                        iconToLast: IconButton(
                          onPressed: () {
                            context.read<InventoryBloc>().add(
                                FetchInventoryEvent(
                                    page: state.lastPage,
                                    screen: DisplayInventoryScreen
                                        .displayInventoryScreen));
                          },
                          icon: const Icon(Icons.skip_next_outlined),
                        ),
                      ),
                      Text('${state.currentPage} / ${state.lastPage}', style:  const TextStyle(fontStyle: FontStyle.italic),)
                    ],
                  ),
                );

                // return SingleChildScrollView(
                //   child: DxInventoryTable(list: state.data),
                // );
              }
              return Text(state.message);
            },
          ).expand(),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
        ],
      ),
    );
  }
}
