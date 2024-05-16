// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// import '../../domain/entity/inventory_entity_customer.dart';
//
// class CustomerInventoryDataGrid extends DataGridSource {
//   CustomerInventoryDataGrid({required List<ItemEntityCustomer> items}) {
//     dataGridRows = items
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//       DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
//       DataGridCell<String>(columnName: 'name', value: dataGridRow.vehicle?.name),
//       DataGridCell<String>(
//           columnName: 'email', value: dataGridRow.cusEmail),
//       DataGridCell<String>(
//           columnName: 'phone', value: dataGridRow.cusId.toString()),
//       DataGridCell<String>(
//           columnName: 'color',
//           value: dataGridRow.vehicle?.color),
//       DataGridCell<bool>(
//           columnName: 'is_key', value: dataGridRow.vehicle?.isKey),
//       DataGridCell<String>(
//           columnName: 'created_at',
//           value: dataGridRow.createdAt.toString()),
//     ]))
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
//           return Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 dataGridCell.value.toString(),
//                 overflow: TextOverflow.ellipsis,
//               ));
//         }).toList());
//   }
// }