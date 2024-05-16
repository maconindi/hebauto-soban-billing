// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/admin_report/domain/entities/report_entitiy.dart';
import 'package:intl/intl.dart';

import '../util/util.dart';

import '../../features_admin/dashboard/presentation/widgets/page_controller_provider.dart';

class DxReportTable extends StatefulWidget {
  final List<ReportItemEntity> list;

  const DxReportTable({super.key, required this.list});

  @override
  State<DxReportTable> createState() => _DxInventoryTableState();
}

class _DxInventoryTableState extends State<DxReportTable> {
  final yourScrollController = ScrollController();

  static const fontSize = 13.0;
  static const lineThickness = 0.5;
  static const doubleColumnWidth = 130.0;
  final index = 0;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      //always show scrollbar
      thickness: 20,
      //width of scrollbar
      controller: yourScrollController,
      radius: Radius.circular(defaultItemsRadius),
      //corner ra
      child: SingleChildScrollView(
        controller: yourScrollController,
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 70,
          //horizontalMargin: 5,
          columnSpacing: 30.0,
          dataRowHeight: 80,
          // checkboxHorizontalMargin: 0,
          border: TableBorder.all(
              color: grey,
              borderRadius: BorderRadius.circular(defaultItemsRadius)),
          showBottomBorder: true,
          columns: [
            DataColumn(
              label: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID',
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold)),
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Date',
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold)),
                  // Container(
                  // width: doubleColumnWidth,
                  // height: lineThickness,
                  // color: grey,
                  // ),
                  //const Text('Inventory Id',
                  //  style: TextStyle(
                  //  fontSize: fontSize, fontWeight: FontWeight.bold)),
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Costumer Details',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Car Details',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  //Container(
                  // width: doubleColumnWidth,
                  // height: lineThickness,
                  // color: grey,
                  // ),
                  //const Text(
                  //'Color & Year',
                  //style: TextStyle(
                  //  fontSize: fontSize, fontWeight: FontWeight.bold),
                  // )
                ],
              ).expand(),
            ),
            DataColumn(
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Invoice Number',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: doubleColumnWidth,
                    height: lineThickness,
                    color: grey,
                  ),
                  const Text(
                    'Invoice Amount',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )
                  //Container(
                  /// width: doubleColumnWidth,
                  // height: lineThickness,
                  // color: grey,
                  //),
                  // const Text(
                  // 'Vin Number',
                  //// style: TextStyle(
                  //fontSize: fontSize, fontWeight: FontWeight.bold),
                  // )
                ],
              ).expand(),
            ),
            DataColumn(
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HST/PST',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: doubleColumnWidth,
                    height: lineThickness,
                    color: grey,
                  ),
                  const Text(
                    'Customs/ VAT',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: doubleColumnWidth,
                    height: lineThickness,
                    color: grey,
                  ),
                  const Text(
                    'Shipping Cost',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )
                ],
              ).expand(),
            ),
            DataColumn(
              label: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Towing',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: doubleColumnWidth,
                    height: lineThickness,
                    color: grey,
                  ),
                  const Text(
                    'Warehouse',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  )
                ],
              ).expand(),
            ),
            // DataColumn(
            //  label: const Row(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //  children: [
            //   Text(
            //    'Key',
            //    style: TextStyle(
            //  fontSize: fontSize, fontWeight: FontWeight.bold),
            //    ),
            //  ],
            // ).expand(),
            //  ),
            DataColumn(
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Shipping Cost',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Credit',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Debit',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ).expand(),
            ),
            DataColumn(
              label: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ).expand(),
            ),
            //DataColumn(
            // label: const Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //  Text(
            //   'Shipping Date',
            // style: TextStyle(
            //   fontSize: fontSize, fontWeight: FontWeight.bold),
            // ),
            // ],
            //).expand(),
            // ),
            // DataColumn(
            // label: const Text(
            // 'Shipping Amount (AED)',
            // style:
            //    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            //).expand(),
            //  ),
            //DataColumn(
            //label: const Text(
            //'Arrival Date',
            // style:
            // TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            //  ).expand(),
            //  ),
            // DataColumn(
            // label: const Text(
            //  'Off-Loading Port',
            // style:
            //    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            //),
            //  DataColumn(
            //  label: const Text(
            //  'VAT Amount (AED)',
            //  style:
            //    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            //  ),
            // DataColumn(
            // label: const Text(
            //  'Holding Warehouse',
            /// style:
            //  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            // ),
            /// DataColumn(
            //  label: const Text(
            //  'Picking Date',
            //  style:
            //    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
//).expand(),
            // ),
            // DataColumn(
            //label: const Text(
            //// 'Total Shipping Cost',
            //  style:
            //   TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            // ),
            // DataColumn(
            // label: const Text(
            //  'Paid',
            //  style:
            // TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            //  ),
            // DataColumn(
            // label: const Text(
            //  'Edit',
            // style:
            //  TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            // ).expand(),
            //  ),
          ],
          rows: widget.list.asMap().entries.map(
            (item) {
              final e = item.value;
              return DataRow(
                color: item.key % 2 == 0
                    ? MaterialStateProperty.all(lightGrey)
                    : MaterialStateProperty.all(white),
                onLongPress: () {
                  PageControllerProvider.of(context)
                      ?.pageController
                      .jumpToPage(11);
                  PageControllerProvider.of(context)?.reportEntity = e;
                },
                cells: [
                  DataCell(
                    Center(
                      child: Text('${e.id}'),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              '${e.vehicle?.createdAt != null ? DateFormat('dd-MM-yyyy').format(e.vehicle!.createdAt!) : 'N/A'}'),

                          //Tooltip(
                          // message: '${e.inventId.validate(value: 'N/A')}',
                          //child: Text(e.inventId
                          // .validate(value: 'N/A')
                          //.substring(0, 10))),
                        ],
                      ),
                    ),
                  ),

// Costumer Details
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              ' ${e.cusCompany.validate(value: 'N/A') ?? 'N/A'}'),
                          Text('${e.cusName.validate(value: 'N/A') ?? 'N/A'}'),
                          5.height,
                        ],
                      ),
                    ),
                  ),
                  //DataCell(Center(
                  //  child: IconButton(
                  //   onPressed: () {
                  //    if ((e.vehicle?.images.length ?? 0) > 0) {
                  //     showDialog(
                  //    context: context,
                  //    builder: (BuildContext context) {
                  //    return DxImagesDialog(
                  //     images: e.vehicle?.images ?? [],
                  //   );
                  //// },
                  //  );
                  // }
                  // },
                  // icon: Tooltip(
                  //  message: (e.vehicle?.images.length ?? 0) > 0
                  //   ? ''
                  //  : 'No Images',
                  // child: Icon(
                  //  Icons.car_repair_outlined,
                  // color: ((e.vehicle?.images.length ?? 0) > 0)
                  // ? greenColor
                  // : redColor,
                  // ),
                  //),
                  // ),
                  //)),
//--------------Car details----------------------+
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Name:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' ${e.vehicle?.name.validate(value: 'N/A') ?? 'N/A'}',
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Text(
                                'Vin No: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${e.vehicle?.vinNumber.validate(value: 'N/A') ?? 'N/A'}',
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Text(
                                'Lot No: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${e.vehicle?.lotNumber.validate(value: 'N/A') ?? 'N/A'}',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
//------------Invoice Number/Amount-----------------------------
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Text(
                                '${e.invoice?.invoiceNumber.validate(value: 'N/A') ?? 'N/A'}')
                          ]),
                          5.height,
                          Row(
                            children: [
                              const Text(
                                'CAD',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${e.invoice?.invoiceAmountCad.validate(value: 'N/A') ?? 'N/A'}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
//-----HST/PST---Customs/VAT----Shipping-----------------------------------
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'CAD',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' ${e.invoice?.hstAmountCad.validate(value: 'N/A') ?? 'N/A'}',
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Text(
                                'AED',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' ${e.port?.customCostAed.validate(value: 'N/A') ?? 'N/A'}',
                              ),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Text(
                                'CAD',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${e.shipping?.shippingCostCad.validate(value: 'N/A') ?? 'N/A'}',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Towing / WareHouse
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'CAD ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${e.towing?.towingCostCad.validate(value: 'N/A') ?? 'N/A'}'),
                            ],
                          ),
                          5.height,
                          Row(children: [
                            const Text(
                              'CAD ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                '${e.warehouse?.storageCost.validate(value: 'N/A') ?? 'N/A'}'),
                          ])
                        ],
                      ),
                    ),
                  ),
                  //  DataCell(
                  //  Center(
                  //   child: Tooltip(
                  //  message:
                  //    '${(e.invoice?.invoiceUrl.isEmpty ?? false || e.invoice?.invoiceUrl == 'N/A') ? 'Pending' : ''}',
                  //  child: IconButton(
                  //  onPressed: () {
                  //   if ((e.invoice?.invoiceUrl.isNotEmpty ??
                  //  false || e.invoice?.invoiceUrl != 'N/A')) {
                  //   showDialog(
                  //     context: context,
                  //    builder: (BuildContext context) {
                  //    return DxPdfViewer(
                  //       url: e.invoice?.invoiceUrl ?? '');
                  //  },
                  //    );
                  //   }
                  //   },
                  // icon: Icon(Icons.picture_as_pdf_outlined,
                  // color: (e.invoice?.invoiceUrl.isEmpty ??
                  //    false || e.invoice?.invoiceUrl == 'N/A')
                  //    ? redColor
                  //   : greenColor),
                  //  ),
                  //  ),
                  // ),
                  // ),
                  // DataCell(
                  //   Center(
                  //   child: Tooltip(
                  //   message:
                  //     '${(e.vehicle?.isKey ?? false) ? 'Available' : 'Not Available'}',
                  // child: Icon(Icons.circle,
                  //color: (e.vehicle?.isKey ?? false)
                  //   ? Colors.green
                  //  : Colors.red),
                  // ),
                  //),
                  // ),
                  DataCell(
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'CAD',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          5.height,
                          Text(e.shipping?.shippingCostCad
                                  .validate(value: 'N/A') ??
                              'N/A')
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(e.towing?.departurePort.validate(value: 'N/A') ??
                              'N/A'),
                          5.height,
                          Text(
                              e.towing?.towingCity.validate(value: 'N/A') ?? '')
                        ],
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(e.shipping?.containerNumber
                                  .validate(value: 'N/A') ??
                              'N/A'),
                          5.height,
                          Text(e.shipping?.bookingNumber
                                  .validate(value: 'N/A') ??
                              '')
                        ],
                      ),
                    ),
                  ),
                  //const DataCell(
                  //Center(
                  //child: Text(''
                  //'${e.exptShippingDate?.toIso8601String() ?? 'N/A'}',
                  // ),
                  //  ),
                  // ),
                  // const DataCell(
                  //Center(
                  //  child: Text(''
                  //'${e.exptShippingDate?.toIso8601String() ?? 'N/A'}',
                  // ),
                  // ),
                  //  ),
                  //// DataCell(
                  // Center(
                  // child: Text(
                  // e.invoice?.totalAmountAed.validate(value: 'N/A') ??
                  //'N/A'),
                  //),
                  // ),
                  //const DataCell(
                  // Center(
                  //  child: Text(''
                  //'${e.actArrivalDate?.toIso8601String() ?? 'N/A'}',
                  //   ),
                  // ),
                  // ),
                  // DataCell(
                  //  Center(
                  //  child: Text(
                  // e.shipping?.offLoadingPort.validate(value: 'N/A') ??
                  //  'N/A'),
                  // ),
                  // ),
                  //const DataCell(Text('1123 AED')),
                  const DataCell(
                    Center(
                      child: Text(''
                          // '${e.departurePort.validate(value: 'N/A')}'
                          ),
                    ),
                  ),
                  // DataCell(
                  //  Center(
                  //  child: Text(
                  // e.warehouse?.name.validate(value: 'N/A') ?? 'N/A'),
                  //   ),
                  // ),
                  // const DataCell(
                  //  Center(
                  //  child: Text(''
                  //'${e.actArrivalDate ?? 'N/A'}'
                  //     ),
                  //  ),
                  //  ),
                  // const DataCell(
                  //   Center(child: Text('123455 \$')),
                  // ),
                  // DataCell(
                  //  Center(
                  //   child: IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //   Icons.brightness_1,
                  //   color: greenColor,
                  // ),
                  // ),
                  // ),
                  // ),
                  // DataCell(
                  //  Center(
                  //  child: IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //    Icons.edit_outlined,
                  //    color: greenColor,
                  // ),
                  // ),
                  // ),
                  // ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
