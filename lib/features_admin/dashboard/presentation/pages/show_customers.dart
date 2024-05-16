//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hebauto/core/util/constants.dart';
// import 'package:hebauto/core/util/ext/ext.dart';
//
// import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
// import 'package:hebauto/features_admin/dashboard/presentation/widgets/customer_datagrid.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
//
// import '../bloc/fetch_customers_bloc/fetch_customer_event.dart';
// import '../bloc/fetch_customers_bloc/fetch_customers_bloc.dart';
// import '../bloc/fetch_customers_bloc/fetch_customers_state.dart';
//
//
// class ShowCustomersScreen extends StatefulWidget {
//   const ShowCustomersScreen({super.key});
//
//   @override
//   State<ShowCustomersScreen> createState() => _ShowCustomersScreenState();
// }
//
// class _ShowCustomersScreenState extends State<ShowCustomersScreen> {
//   late CustomerDataSource _customerDataSource;
//   @override
//   void initState() {
//     super.initState();
//    //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());
//
//     // Call the method to fetch data when the screen is first initialized
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // Call the method to fetch data every time the route changes
//     if (ModalRoute.of(context)?.isCurrent == true) {
//       context.read<FetchCustomerBloc>().add(FetchCustomersEvent());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: context.width(),
//       padding: const EdgeInsets.symmetric(horizontal: 40),
//       child: Column(
//         children: [
//           defaultWidgetsVerticalSpacing,
//           BlocBuilder<FetchCustomerBloc, FetchCustomersState>(
//             builder: (context, state) {
//
//               //print('${state}');
//               if (state.status.isLoading) {
//                 return const Align(
//                     alignment: Alignment.center,
//                     child: CircularProgressIndicator());
//               } else if (state.status.isError) {
//                 return Text(state.message);
//               }
//               else if (state.status.isSuccess) {
//                 _customerDataSource = CustomerDataSource(employees: state.data);
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: SfDataGrid(
//
//                     columnWidthMode: ColumnWidthMode.fill,
//
//                     source: _customerDataSource,
//                     columns: [
//                       GridColumn(
//                           columnName: 'id',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'ID',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'name',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Name',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'email',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Email',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'phone',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Phone',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'trading_license',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Trading License',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'company_name',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Company',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                       GridColumn(
//                           columnName: 'created_at',
//                           label: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 'Creation Date',
//                                 overflow: TextOverflow.ellipsis,
//                               ))),
//                     ],
//                   ),
//                 );
//
//               }
//
//               return Container(
//                 child: Text(state.message),
//               );
//
//
//
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
