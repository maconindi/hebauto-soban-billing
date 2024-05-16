
import 'package:excel/excel.dart';

exportAReportToExcel(
  List dataDate,
  List dataCus_info,
  List dataCar_Details,
  List dataInvoice_Details,
  List dataHST_PST_Shipping_Details,
  List Towing_Warehouse_Details,
  List Total_shipping_Warehouse_Details,
) {
  final excel = Excel.createExcel(); // Ensure this returns a non-null value
  final sheet = excel.sheets[excel.getDefaultSheet() as String];
  if (sheet != null) {
    sheet.setColumnWidth(2, 50);
    sheet.setColumnAutoFit(3);
    //sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3));
    //sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3));
    int rowIndex0 = 0;
    int columnIndex0 = 0;

    for (var cellData in dataDate) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex0, rowIndex: rowIndex0))
          .value = TextCellValue(cellData.toString());

      rowIndex0++;
    }
//---------------------------------------------------------------
    int rowIndexTitle = 0;
    int columnIndexTitle = 0;
    List titleData = [
      'Date',
      'Costumer Details',
      'Car Details',
      'Invoice Number / Invoice Amount',
      '(HST/PST)-(Customs / VAT)-(Sipping Cost)',
      'Towing / Warehouse',
      'Total Shipping Cost',
      'Credit',
      'Debit',
      'Balance',
    ];
    for (var cellData in titleData) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndexTitle, rowIndex: rowIndexTitle))
          .value = TextCellValue(cellData.toString());

      columnIndexTitle++;
    }
//------------------------------------------------------------
    int rowIndex1 = 1;
    int columnIndex1 = 1;

    for (var cellData in dataCus_info) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex1, rowIndex: rowIndex1))
          .value = TextCellValue(cellData.toString());

      rowIndex1++;
    }
    //---------------------------------------------------
    int rowIndex2 = 1;
    int columnIndex2 = 2;

    for (var cellData in dataCar_Details) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex2, rowIndex: rowIndex2))
          .value = TextCellValue(cellData.toString());

      rowIndex2++;
    }
//--------------------------------------------------------
    int rowIndex3 = 1;
    int columnIndex3 = 3;

    for (var cellData in dataInvoice_Details) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex3, rowIndex: rowIndex3))
          .value = TextCellValue(cellData.toString());

      rowIndex3++;
    }
    //----------------------------------------
    int rowIndex4 = 1;
    int columnIndex4 = 4;

    for (var cellData in dataHST_PST_Shipping_Details) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex4, rowIndex: rowIndex4))
          .value = TextCellValue(cellData.toString());

      rowIndex4++;
    }
    //----------------------------------------
    int rowIndex5 = 1;
    int columnIndex5 = 5;

    for (var cellData in Towing_Warehouse_Details) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex5, rowIndex: rowIndex5))
          .value = TextCellValue(cellData.toString());

      rowIndex5++;
    }
    //----------------------------------------
    int rowIndex6 = 1;
    int columnIndex6 = 6;

    for (var cellData in Total_shipping_Warehouse_Details) {
      sheet
          .cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex6, rowIndex: rowIndex6))
          .value = TextCellValue(cellData.toString());

      rowIndex6++;
    }

    excel.save(fileName: '${DateTime.now()}.xlsx');
  } else {

  }
}

List<List<dynamic>> generateDummyList() {
  List<List<dynamic>> dummyList = [];

  // Generate 5 rows
  for (int i = 0; i < 5; i++) {
    List<dynamic> row = [];

    // Generate 12 columns
    for (int j = 0; j < 12; j++) {
      // Add dummy data to each cell
      row.add('Row $i, Col $j');
    }

    // Add the row to the dummy list
    dummyList.add(row);
  }

  return dummyList;
}
