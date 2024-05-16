// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
//
//
// class DxGridDataSource<T> extends DataGridSource {
//   DxGridDataSource({required List<T> data, required this.columnNames}) {
//     dataGridRows = data.map((item) {
//
//       //final item1 = item?.convertToJson();
//
//       return DataGridRow(
//           cells: columnNames.map((columnName) {
//         dynamic value = _getValue(item, columnName);
//         return DataGridCell(columnName: columnName, value: {'a': '', 'b': ''});
//       }).toList());
//     }).toList();
//
//     // dataGridRows = data.map<DataGridRow>((item) {
//     //   return DataGridRow(cells: _getCellList(item));
//     // }).toList();
//   }
//
//   List<DataGridRow> dataGridRows = [];
//   List<String> columnNames = [];
//
//   @override
//   List<DataGridRow> get rows => dataGridRows;
//
//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((dataGridCell) {
//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             dataGridCell.value['a'],
//             overflow: TextOverflow.ellipsis,
//           ),
//         );
//       }).toList(),
//     );
//   }
//
//   // List<DataGridCell<dynamic>> _getCellList(T item) {
//   //   final List<DataGridCell<dynamic>> cells = [];
//   //
//   //   log('${item.toString()}');
//   //
//   //   final type = T.toString();
//   //   final properties = type.contains(' ') ? type.split(' ').last : type;
//   //
//   //   properties.split(',').forEach((property) {
//   //     final propertyName = property.trim();
//   //     dynamic value = _getValue(item, propertyName);
//   //     cells.add(DataGridCell<dynamic>(columnName: propertyName, value: value));
//   //   });
//   //
//   //   return cells;
//   // }
//
//   // dynamic _getValue(T item, String propertyName) {
//   //   if (item != null) {
//   //     final dynamic value = (item as dynamic)[propertyName];
//   //     return value;
//   //   }
//   //   return null;
//   // }
//
//   dynamic _getValue(T item, String columnName) {
//
//
//     switch (columnName) {
//       case 'reference':
//         return {
//           'a': '',
//           'b':'',
//         };
//       case 'title':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'type':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'layout':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'price':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'updated':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'status':
//         return {
//           'a':'',
//           'b':'',
//         };
//       case 'listing':
//         return {
//           'a':'',
//           'b':'',
//         };
//       default:
//         return null;
//     }
//   }
// }
//
// // class Employee {
// //   Employee(this.id, this.name, this.designation, this.salary);
// //
// //   final int id;
// //   final String name;
// //   final String designation;
// //   final int salary;
// // }
// //
// //
// //
// // class EmployeeDataSource<T> extends DataGridSource {
// //   EmployeeDataSource({required List<Employee> employees}) {
// //     dataGridRows = employees
// //         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
// //               DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
// //               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
// //               DataGridCell<String>(
// //                   columnName: 'designation', value: dataGridRow.designation),
// //               DataGridCell<int>(
// //                   columnName: 'salary', value: dataGridRow.salary),
// //             ]))
// //         .toList();
// //   }
// //
// //   List<DataGridRow> dataGridRows = [];
// //
// //   @override
// //   List<DataGridRow> get rows => dataGridRows;
// //
// //   @override
// //   DataGridRowAdapter? buildRow(DataGridRow row) {
// //     return DataGridRowAdapter(
// //         cells: row.getCells().map<Widget>((dataGridCell) {
// //       return Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //           child: Text(
// //             dataGridCell.value.toString(),
// //             overflow: TextOverflow.ellipsis,
// //           ));
// //     }).toList());
// //   }
// // }
