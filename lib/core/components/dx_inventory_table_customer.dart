// ignore_for_file: unnecessary_string_interpolations



import 'package:flutter/material.dart';
import 'package:hebauto/core/services/download/file_manager_web.dart';
import 'package:hebauto/core/util/ext/ext.dart';


import '../../features_customer/inventory/domain/entity/inventory_entity_customer.dart';

import '../util/util.dart';

import 'dx_pdf_viewer.dart';
import 'dx_popup_images.dart';

class DxInventoryTableCustomer extends StatefulWidget {


  const DxInventoryTableCustomer({super.key, required this.list});
  final List<ItemEntityCustomer> list;

  @override
  State<DxInventoryTableCustomer> createState() =>
      _DxInventoryTableCustomerState();
}

class _DxInventoryTableCustomerState extends State<DxInventoryTableCustomer> {
  final yourScrollController = ScrollController();

  static const fontSize = 13.0;
  static const lineThickness = 0.5;
  static const doubleColumnWidth = 130.0;



  @override
  Widget build(BuildContext contextParent) {




    return Scrollbar(
      thumbVisibility: true,
      //always show scrollbar
      thickness: 10,
      //width of scrollbar
      controller: yourScrollController,
      radius: Radius.circular(defaultItemsRadius),
      //corner ra
      child: Column(
        children: [
          SingleChildScrollView(
            controller: yourScrollController,
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 70,
              //horizontalMargin: 5,
              columnSpacing: 20,
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
                      SelectableText('Stock #',
                          style: TextStyle(
                              fontSize: fontSize, fontWeight: FontWeight.bold)),
                    ],
                  ).expand(),
                ),

                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Car Description',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Color & Year',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ).expand(),
                ),

                DataColumn(
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        'Invoice',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ).expand(),
                ),

                DataColumn(
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        'Car Photos',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ).expand(),
                ),
                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Warehouse Images',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Arrival Images',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Lot Number',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Vin Number',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ).expand(),
                ),
                // DataColumn(
                //   label: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       const SelectableText(
                //         'Invoice Date',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       ),
                //       Container(
                //         width: doubleColumnWidth,
                //         height: lineThickness,
                //         color: grey,
                //       ),
                //       const SelectableText(
                //         'Invoice Number',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ).expand(),
                // ),
                ///
                // DataColumn(
                //   label: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SelectableText(
                //         'Invoice Document',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ).expand(),
                // ),
                ///
                DataColumn(
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableText(
                        'Key',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ).expand(),
                ),

                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Warehouse',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Towing City',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ).expand(),
                ),
                // DataColumn(
                //   label: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       const SelectableText(
                //         'Invoice Amount CAD',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       ),
                //       Container(
                //         width: doubleColumnWidth,
                //         height: lineThickness,
                //         color: grey,
                //       ),
                //       const SelectableText(
                //         'HST/PST Amount CAD',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       )
                //     ],
                //   ).expand(),
                // ),

                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Container Number',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Booking Number',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ).expand(),
                ),
                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const SelectableText(
                        'Shipping Date',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),

                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),

                      const SelectableText(
                        'Expected Arrival Date',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),

                    ],
                  ).expand(),
                ),

                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Shipping Amount (AED)',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'VAT Amount (AED)',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ).expand(),
                ),
                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Destination Port',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Arrival Date',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                DataColumn(
                  label: const SelectableText(
                    'VCC Issued?',
                    style:
                        TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ).expand(),
                ),
                DataColumn(
                  label: const SelectableText(
                    'Car Delivery Date',
                    style:
                        TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ).expand(),
                ),
                DataColumn(
                  label: const SelectableText(
                    'Paid',
                    style:
                        TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ).expand(),
                ),
              ],
              rows: widget.list.asMap().entries.map(
                (item) {
                  final e = item.value;

                  return DataRow(
                    color: item.key % 2 == 0
                        ? MaterialStateProperty.all(lightGrey)
                        : MaterialStateProperty.all(white),
                    onLongPress: () {
                      // PageControllerProvider.of(context)
                      //     ?.pageController
                      //     .jumpToPage(11);
                      // PageControllerProvider.of(context)?.entity = e;
                    },
                    cells: [
                      DataCell(
                        Center(
                          child: SelectableText('${formatIndex(item.key + 1)}'),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                  '${e.vehicle?.name.validate(value: 'N/A') ?? 'N/A'}'),
                              5.height,
                              SelectableText(
                                  '${e.vehicle?.color} | ${e.vehicle?.year.validate(value: 'N/A') ?? 'N/A'}'),
                            ],
                          ),
                        ),
                      ),

                      DataCell(
                        Center(
                          child: Tooltip(
                            message:
                            '${((e.invoice?.invoiceUrl.isEmpty ?? false)|| (e.invoice?.invoiceUrl.trim() == 'N/A'.trim()) ) ? 'Pending' : ''}',
                            child: IconButton(
                              onPressed: () {
                                if (((e.invoice?.invoiceUrl.isNotEmpty ??
                                    false) || (e.invoice?.invoiceUrl.trim() == 'N/A'.trim()) )) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DxPdfViewer(
                                          vin: e.vehicle?.vinNumber ?? '',
                                          url: e.invoice?.invoiceUrl ?? '');
                                    },
                                  );
                                }
                              },
                              icon: Icon(Icons.picture_as_pdf_outlined,
                                  color: ((e.invoice?.invoiceUrl.isEmpty ??
                                      false )|| (e.invoice?.invoiceUrl.trim() == 'N/A'.trim()) )
                                      ? redColor
                                      : greenColor),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: () async {
                              if ((e.vehicle?.images.length ?? 0) > 0) {
                                
                                // final res = await getIt<DioClient>().dio.post('http://127.0.0.1:8000/customer/download-images', data:
                                // {
                                //   'fileName':'aplha',
                                //   'imageUrls' : ['https://hebautogroup.com/uploads/info@hebautogroup.com/0cc2300069611f2884e6a726861034cd/images/11937410X_6_65fe85ed7e8c9.JPG',
                                //     'https://hebautogroup.com/uploads/info@hebautogroup.com/0cc2300069611f2884e6a726861034cd/images/11937410X_4_65fe85ed7e794.JPG',
                                //     'https://hebautogroup.com/uploads/info@hebautogroup.com/0cc2300069611f2884e6a726861034cd/images/11937410X_1_65fe85ed42515.JPG']
                                // }
                                // );
                                //
                                // List<int> fileBytes = base64Decode(res.data);
                                //
                                //
                                // AnchorElement(href: 'data:application/zip;base64,${base64Encode(fileBytes ?? [])}')
                                //   ..setAttribute('download', 'images.zip')
                                //   ..click();
                                //
                                //
                                // // Stream.fromFuture(res.data);
                                //
                                // debugPrint('>>> response is valid >> ${res.statusCode}  ${res.data.toString()}');
                                showDialog(
                                  context: context,

                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),

                                        TextButton(
                                          onPressed: () async {
                                           final manager = FileManager();

                                           'Saving Images, Please Wait!'.toToastWarning(context, title: 'Downloading');
                                           Navigator.of(context).pop();

                                           manager.downloadMultiple(e.vehicle?.images ?? [], '${e.vehicle?.vinNumber}_IMAGES').then((value) => {

                                           }).catchError((error){
                                             'Something went wrong, Please try again!'.toToastError(contextParent);
                                             return {};
                                           });
                                           //context.pop();
                                          },
                                          child: const Text('Download'),
                                        ),
                                      ],
                                      content: DxImagesDialog(
                                        images: e.vehicle?.images ?? [],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            icon: Tooltip(
                                message: (e.vehicle?.images.length ?? 0) > 0
                                    ? ''
                                    : 'No Images',
                                child: Icon(
                                  Icons.car_repair_outlined,
                                  color: ((e.vehicle?.images.length ?? 0) > 0)
                                      ? greenColor
                                      : redColor,
                                )),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if ((e.shipping?.images.length ?? 0) > 0) {

                                      showDialog(
                                        context: context,

                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Close'),
                                              ),

                                              TextButton(
                                                onPressed: () async {
                                                  final manager = FileManager();

                                                  'Saving Images, Please Wait!'.toToastWarning(context, title: 'Downloading');
                                                  Navigator.of(context).pop();

                                                  manager.downloadMultiple(e.shipping?.images ?? [], '${e.vehicle?.vinNumber}_WAREHOUSE').then((value) => {

                                                  }).catchError((error){
                                                    'Something went wrong, Please try again!'.toToastError(contextParent);
                                                    //return Future.value('ok');
                                                  });


                                                  // final manager = FileManager();
                                                  // await manager.downloadMultiple(e.shipping?.images ?? [], '${e.vehicle?.vinNumber}_WAREHOUSE');
                                                  // context.pop();
                                                },
                                                child: const Text('Download'),
                                              ),
                                            ],
                                            content: DxImagesDialog(
                                              images: e.shipping?.images ?? [],
                                            ),
                                          );
                                        },
                                      );
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return DxImagesDialog(
                                      //       images: e.shipping?.images ?? [],
                                      //     );
                                      //   },
                                      // );
                                    }
                                  },
                                  icon: Tooltip(
                                    message: (e.shipping?.images.length ?? 0) > 0
                                        ? ''
                                        : 'No Images',
                                    child: Icon(
                                      Icons.warehouse_outlined,
                                      color: ((e.shipping?.images.length ?? 0) > 0)
                                          ? greenColor
                                          : redColor,
                                    ),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    if ((e.warehouse?.images.length ?? 0) > 0) {
                                      showDialog(
                                        context: context,

                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Close'),
                                              ),

                                              TextButton(
                                                onPressed: () async {


                                                  final manager = FileManager();

                                                  'Please wait! Images are being downloading.'.toToastWarning(context, title: 'Downloading');
                                                  Navigator.of(context).pop();

                                                  manager.downloadMultiple(e.warehouse?.images ?? [], '${e.vehicle?.vinNumber}_ARRIVAL').then((value) => {

                                                  }).catchError((error){
                                                    'Something went wrong, Please try again!'.toToastError(contextParent);
                                                    //return Future.value('ok');
                                                  });

                                                  // final manager = FileManager();
                                                  // await manager.downloadMultiple(e.warehouse?.images ?? [], '${e.vehicle?.vinNumber}_ARRIVAL');
                                                  // context.pop();
                                                },
                                                child: const Text('Download'),
                                              ),
                                            ],
                                            content: DxImagesDialog(
                                              images: e.warehouse?.images ?? [],
                                            ),
                                          );
                                        },
                                      );


                                      // showDialog(
                                      //   context: context,
                                      //   builder: (BuildContext context) {
                                      //     return DxImagesDialog(
                                      //       images: e.warehouse?.images ?? [],
                                      //     );
                                      //   },
                                      // );
                                    }
                                  },
                                  icon: Tooltip(
                                    message: (e.warehouse?.images.length ?? 0) > 0
                                        ? ''
                                        : 'No Images',
                                    child: Icon(
                                      Icons.fire_truck_outlined,
                                      color: ((e.warehouse?.images.length ?? 0) > 0)
                                          ? greenColor
                                          : redColor,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),

                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                  '${e.vehicle?.lotNumber.validate(value: 'N/A') ?? 'N/A'}'),
                              5.height,
                              SelectableText(
                                  '${e.vehicle?.vinNumber.validate(value: 'N/A') ?? 'N/A'}')
                            ],
                          ),
                        ),
                      ),
                      // DataCell(
                      //   Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         SelectableText(
                      //             '${(e.invoice?.invoiceDate?.toIso8601String().isNotEmpty ?? false) ? formatDateTime(e.invoice?.invoiceDate ?? DateTime(0)) : 'N/A'}'),
                      //         5.height,
                      //         SelectableText(
                      //             e.invoice?.invoiceNumber.validate(value: 'N/A') ??
                      //                 'N/A')
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      ///
                      // DataCell(
                      //   Center(
                      //     child: Tooltip(
                      //       message:
                      //       '${(e.invoice?.invoiceUrl.isEmpty ?? false || e.invoice?.invoiceUrl == 'N/A') ? 'Pending' : ''}',
                      //       child: IconButton(
                      //         onPressed: () {
                      //
                      //
                      //           if ((e.invoice?.invoiceUrl.isNotEmpty ?? false || e.invoice?.invoiceUrl != 'N/A')) {
                      //             showDialog(
                      //               context: context,
                      //               builder: (BuildContext context) {
                      //                 return DxPdfViewer(
                      //                     url: e.invoice?.invoiceUrl ?? '');
                      //               },
                      //             );
                      //           }
                      //         },
                      //         icon: Icon(Icons.picture_as_pdf_outlined,
                      //             color: (e.invoice?.invoiceUrl.isEmpty ?? false || e.invoice?.invoiceUrl == 'N/A')
                      //                 ? redColor
                      //                 : greenColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ///
                      DataCell(
                        Center(
                          child: Tooltip(
                            message:
                                '${(e.vehicle?.isKey ?? false) ? 'Available' : 'Not Available'}',
                            child: Icon(Icons.circle,
                                color: (e.vehicle?.isKey ?? false)
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                      ),

                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(e.towing?.departurePort.validate(value: 'N/A') ??
                                  'N/A'),
                              5.height,
                              SelectableText(
                                  e.towing?.towingCity.validate(value: 'N/A') ?? '')
                            ],
                          ),
                        ),
                      ),

                      // DataCell(
                      //   Center(
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         SelectableText(e.invoice?.invoiceAmountCad
                      //             .validate(value: 'N/A') ??
                      //             'N/A'),
                      //         5.height,
                      //         SelectableText(e.invoice?.hstAmountCad.validate(value: 'N/A') ??
                      //             'N/A')
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(e.shipping?.containerNumber
                                      .validate(value: 'N/A') ??
                                  'N/A'),
                              5.height,
                              SelectableText(e.shipping?.bookingNumber
                                      .validate(value: 'N/A') ??
                                  '')
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SelectableText(formatDateTime(
                                  e.shipping?.shippingDate ?? DateTime(0))),
                              5.height,
                              SelectableText(formatDateTime(
                                  e.shipping?.expArrivalDate ?? DateTime(0))),

                            ],
                          ),
                        ),
                      ),

                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(e.shipping?.shippingCostAed
                                      .validate(value: 'N/A') ??
                                  'N/A'),
                              5.height,
                              SelectableText(e.port?.vatAmountAed.validate(value: 'N/A') ??
                                  'N/A'),
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(e.shipping?.offLoadingPort
                                      .validate(value: 'N/A') ??
                                  'N/A'),
                              5.height,
                              SelectableText(formatDateTime(
                                  e.port?.arrivalDate ?? DateTime(0))),
                            ],
                          ),
                        ),
                      ),

                      //const DataCell(SelectableText('1123 AED')),
                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.circle,
                              color: (e.vcc?.issuedBy.isNotEmpty ?? false)
                                  ? greenColor
                                  : redColor,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: SelectableText(formatDateTime(
                              e.warehouse?.pickedDate ?? DateTime(0))),
                        ),
                      ),

                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.circle,
                              color: (e.vcc?.issuedBy.isNotEmpty ?? false)
                                  ? greenColor
                                  : redColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
        ],
      ),
    );
  }
}
