import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/core/components/dx_dropdown_search.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../../core/components/dx_inventory_table_customer.dart';
import '../../../../core/components/fd_button.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/constants.dart';
import '../../../inventory/presentation/bloc/inventory_bloc.dart';
import '../../../inventory/presentation/bloc/inventory_event.dart';
import '../../../inventory/presentation/bloc/inventory_state.dart';

class ShowCustomerInventory extends StatefulWidget {
  const ShowCustomerInventory({super.key});

  @override
  State<ShowCustomerInventory> createState() => _ShowCustomerInventoryState();
}

class _ShowCustomerInventoryState extends State<ShowCustomerInventory> {
  @override
  void initState() {
    super.initState();
    //context.read<CustomerInventoryBloc>().add(FetchInventoryEvent(page: 1));
    //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());

    // Call the method to fetch data when the screen is first initialized
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to fetch data every time the route changes
    // if (ModalRoute.of(context)?.isCurrent == true) {
    //   //context.read<CustomerInventoryBloc>().add(FetchInventoryEvent(page: 1));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.isPhone()
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DxText(
                        isMobileHeading: true,
                        text: 'My Inventory',
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
                  )
                : const DxText(
                    text: 'My Inventory',
                    size: 30,
                    isBold: true,
                  ),

            20.height,

            SizedBox(
              width: context.isPhone() ? context.width() : context.width() / 2,
              child: Row(
                children: [
                  DropDownSearchWidget(
                    //disableSearch: context.isPhone() ? true : false,

                    callback: (type, args) {
                      if (args.isNotEmpty) {
                        context.read<CustomerInventoryBloc>().add(
                            SearchInventoryEvent(args: args, category: type));
                      } else {
                        context
                            .read<CustomerInventoryBloc>()
                            .add(FetchInventoryEvent());
                      }
                    },
                  ).expand(),
                  5.width,
                  context.isPhone()
                      ? const SizedBox.shrink()
                      : FDButton(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.refresh_rounded,
                                color: whiteColor,
                              ),
                              10.width,
                              const Text(
                                'Refresh',
                                style: TextStyle(color: whiteColor),
                              )
                            ],
                          ),
                          onTap: () {
                            context
                                .read<CustomerInventoryBloc>()
                                .add(FetchInventoryEvent());
                          },
                          //text: 'Refresh List',
                        )
                ],
              ),
            ),

            20.height,
            defaultWidgetsVerticalSpacing,
            SizedBox(
              height: 700,
              child: BlocBuilder<CustomerInventoryBloc, CustomerInventoryState>(
                //buildWhen: (prev , curr) => curr.status.isSuccess,
                builder: (context, state) {
                  //print('${state}');
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
                          DxInventoryTableCustomer(list: state.data),
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
                                //log(' ${state.currentPage}');
                                if (state.lastPage != state.currentPage) {
                                  context.read<CustomerInventoryBloc>().add(
                                      FetchInventoryEvent(
                                          page: state.currentPage + 1));
                                }
                              },
                              icon: const Icon(Icons.navigate_next),
                            ),
                            iconPrevious: IconButton(
                              onPressed: () {
                                //log(' ${state.currentPage}');
                                if (1 != state.currentPage) {
                                  context.read<CustomerInventoryBloc>().add(
                                      FetchInventoryEvent(
                                          page: state.currentPage - 1));
                                }
                              },
                              icon: const Icon(Icons.navigate_before),
                            ),
                            iconToFirst: IconButton(
                              onPressed: () {
                                // log(' ${state.currentPage}');
                                context
                                    .read<CustomerInventoryBloc>()
                                    .add(FetchInventoryEvent());
                              },
                              icon: const Icon(Icons.skip_previous_outlined),
                            ),
                            iconToLast: IconButton(
                              onPressed: () {
                                context.read<CustomerInventoryBloc>().add(
                                    FetchInventoryEvent(page: state.lastPage));
                              },
                              icon: const Icon(Icons.skip_next_outlined),
                            ),
                          ),
                          Text(
                            '${state.currentPage} / ${state.lastPage}',
                            style: const TextStyle(fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    );
                  }
                  return Text(state.message);
                },
              ),
            ),
            // BlocBuilder<CustomerInventoryBloc, CustomerInventoryState>(
            //
            //   builder: (context, state) {
            //
            //
            //
            //     return NumberPagination(
            //       onPageChanged: (int pageNumber) {},
            //       threshold: 2,
            //       pageTotal: state.lastPage,
            //       pageInit: state.currentPage,
            //       iconNext: IconButton(
            //         onPressed: () {
            //           log(' ${state.currentPage}');
            //           if (state.lastPage != state.currentPage) {
            //             context
            //                 .read<CustomerInventoryBloc>()
            //                 .add(FetchInventoryEvent(page: state.currentPage+1));
            //           }
            //         },
            //         icon: const Icon(Icons.navigate_next),
            //       ),
            //       iconPrevious: IconButton(
            //         onPressed: () {
            //
            //           log(' ${state.currentPage}');
            //           if (1 != state.currentPage) {
            //             context
            //                 .read<CustomerInventoryBloc>()
            //                 .add(FetchInventoryEvent(page: state.currentPage-1));
            //           }
            //         },
            //         icon: const Icon(Icons.navigate_before),
            //       ),
            //       iconToFirst: IconButton(
            //         onPressed: () {
            //
            //           log(' ${state.currentPage}');
            //           context
            //               .read<CustomerInventoryBloc>()
            //               .add(FetchInventoryEvent(page: 1));
            //         },
            //         icon: const Icon(Icons.skip_previous_outlined),
            //       ),
            //       iconToLast: IconButton(
            //         onPressed: () {
            //           context
            //               .read<CustomerInventoryBloc>()
            //               .add(FetchInventoryEvent(page: state.lastPage));
            //         },
            //         icon: const Icon(Icons.skip_next_outlined),
            //       ),
            //       colorPrimary: Colors.red,
            //       colorSub: Colors.yellow,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
