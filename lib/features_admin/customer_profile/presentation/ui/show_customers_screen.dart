import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/context.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/customer_profile_state.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/cutomer_profile_bloc.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/widgets/dx_customer_table.dart';
import 'package:number_pagination/number_pagination.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/constants.dart';
import '../bloc/customer_profile_event.dart';

class ShowCustomersScreen extends StatefulWidget {
  static const showCustomersScreen = 'showCustomersScreen';

  const ShowCustomersScreen({super.key});

  @override
  State<ShowCustomersScreen> createState() => _ShowCustomersScreenState();
}

class _ShowCustomersScreenState extends State<ShowCustomersScreen> {
  @override
  void initState() {
    super.initState();

    context
        .read<CustomerProfileBloc>()
        .add(FetchCustomersEvent(page: 1, screen: ''));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.isCurrent == true) {
      context
          .read<CustomerProfileBloc>()
          .add(FetchCustomersEvent(page: 1, screen: ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const DxText(
            text: 'Customers',
            isBold: true,
            size: 30,
            color: black,
          ),
          defaultWidgetsVerticalSpacing,
          BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Align(child: CircularProgressIndicator());
              } else if (state.status.isError) {
                return Text(state.message);
              } else if (state.status.isSuccess) {
                //return Text(' i have the data ${state.data.length}');

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DxCustomerTable(
                        customers: state.data,
                      ),
                      defaultWidgetsVerticalSpacing,
                      defaultWidgetsVerticalSpacing,
                      NumberPagination(
                        threshold: 2,
                        pageTotal: state.lastPage,
                        pageInit: state.currentPage,
                        iconNext: IconButton(
                          onPressed: () {
                            if (state.lastPage != state.currentPage) {
                              context.read<CustomerProfileBloc>().add(
                                    FetchCustomersEvent(
                                        page: state.currentPage + 1,
                                        screen: ShowCustomersScreen
                                            .showCustomersScreen),
                                  );
                            }
                          },
                          icon: const Icon(Icons.navigate_next),
                        ),
                        iconPrevious: IconButton(
                          onPressed: () {
                            if (1 != state.currentPage) {
                              context.read<CustomerProfileBloc>().add(
                                  FetchCustomersEvent(
                                      page: state.currentPage - 1,
                                      screen: ShowCustomersScreen
                                          .showCustomersScreen));
                            }
                          },
                          icon: const Icon(Icons.navigate_before),
                        ),
                        iconToFirst: IconButton(
                          onPressed: () {
                            context.read<CustomerProfileBloc>().add(
                                FetchCustomersEvent(
                                    page: 1,
                                    screen: ShowCustomersScreen
                                        .showCustomersScreen));
                          },
                          icon: const Icon(Icons.skip_previous_outlined),
                        ),
                        iconToLast: IconButton(
                          onPressed: () {
                            context.read<CustomerProfileBloc>().add(
                                FetchCustomersEvent(
                                    page: state.lastPage,
                                    screen: ShowCustomersScreen
                                        .showCustomersScreen));
                          },
                          icon: const Icon(Icons.skip_next_outlined),
                        ),
                        onPageChanged: (int) {},
                      )
                    ],
                  ),
                );
              }

              return Text(state.message);
            },
          )
        ],
      ),
    );
  }
}
