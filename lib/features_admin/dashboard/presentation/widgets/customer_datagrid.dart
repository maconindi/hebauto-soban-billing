// import 'package:flutter/material.dart';
// import 'package:hebauto/features_admin/dashboard/domain/entities/customer_entity.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// class CustomerDataSource extends DataGridSource {
//   CustomerDataSource({required List<CustomerEntity> employees}) {
//     dataGridRows = employees
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//               DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
//               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
//               DataGridCell<String>(
//                   columnName: 'email', value: dataGridRow.email),
//               DataGridCell<String>(
//                   columnName: 'phone', value: dataGridRow.phone),
//               DataGridCell<String>(
//                   columnName: 'trading_license',
//                   value: dataGridRow.tradingLicense),
//               DataGridCell<String>(
//                   columnName: 'company_name', value: dataGridRow.companyName),
//               DataGridCell<String>(
//                   columnName: 'created_at',
//                   value: dataGridRow.createdAt.toString()),
//             ]))
//         .toList();
//   }
//
//   List<DataGridRow> dataGridRows = [];
//
//   @override
//   List<DataGridRow> get rows => dataGridRows;
//
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//       return Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             dataGridCell.value.toString(),
//             overflow: TextOverflow.ellipsis,
//           ));
//     }).toList());
//   }
// }
