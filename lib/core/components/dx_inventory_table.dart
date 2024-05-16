// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_pdf_viewer.dart';
import 'package:hebauto/core/components/dx_popup_images.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:hebauto/features_admin/inventory/presentation/bloc/inventory_event.dart';
//import 'package:nb_utils/nb_utils.dart';

import '../util/util.dart';
import '../../features_admin/inventory/domain/entity/inventory_entity.dart';
import '../../features_admin/dashboard/presentation/widgets/page_controller_provider.dart';
import 'dx_custom_dialogs.dart';

class DxInventoryTable extends StatefulWidget {

  const DxInventoryTable({super.key, required this.list});
  final List<InventoryItemEntity> list;

  @override
  State<DxInventoryTable> createState() => _DxInventoryTableState();
}

class _DxInventoryTableState extends State<DxInventoryTable> {
  final yourScrollController = ScrollController();

  static const fontSize = 13.0;
  static const lineThickness = 0.5;
  static const doubleColumnWidth = 130.0;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      //always show scrollbar
      thickness: 10,
      //width of scrollbar
      controller: yourScrollController,
      radius: Radius.circular(defaultItemsRadius),
      child: Column(
        children: [
          SingleChildScrollView(
            controller: yourScrollController,
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 70,
              //horizontalMargin: 5,
              columnSpacing: 20.0,
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
                      SelectableText('ID',
                          style: TextStyle(
                              fontSize: fontSize, fontWeight: FontWeight.bold)),
                    ],
                  ).expand(),
                ),
                const DataColumn(
                  label: SizedBox.shrink(),
                ),
                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText('Customer Name',
                          style: TextStyle(
                              fontSize: fontSize, fontWeight: FontWeight.bold)),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText('Company',
                          style: TextStyle(
                              fontSize: fontSize, fontWeight: FontWeight.bold)),
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
                DataColumn(
                  label: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Invoice Date',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'Invoice Number',
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
                        'Invoice Document',
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
                        'Invoice Amount CAD',
                        style: TextStyle(
                            fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: doubleColumnWidth,
                        height: lineThickness,
                        color: grey,
                      ),
                      const SelectableText(
                        'HST/PST Amount CAD',
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
                        'Loading Port',
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
                // DataColumn(
                //   label: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SelectableText(
                //         'Expected Departure Date',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SelectableText(
                //         'Shipping Date',
                //         style: TextStyle(
                //             fontSize: fontSize, fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Shipping Amount (AED)',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Arrival Date',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Off-Loading Port',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'VAT Amount (AED)',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Holding Warehouse',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Picking Date',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Total Shipping Cost',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
                DataColumn(
                  label: const SelectableText(
                    'Paid',
                    style:
                        TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ).expand(),
                ),
                // DataColumn(
                //   label: const SelectableText(
                //     'Edit',
                //     style:
                //         TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                //   ).expand(),
                // ),
              ],
              rows: widget.list.asMap().entries.map(
                (item) {
                  final e = item.value;

                  return DataRow(
                    color: item.key % 2 == 0
                        ? MaterialStateProperty.all(lightGrey)
                        : MaterialStateProperty.all(white),
                    // onLongPress: () {
                    //
                    // },
                    cells: [
                      DataCell(
                        Center(
                          child: SelectableText('${item.key}'),
                        ),
                      ),


                      DataCell(
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {

                                    PageControllerProvider.of(context)
                                        ?.pageController
                                        .jumpToPage(11);
                                    PageControllerProvider.of(context)?.entity = e;

                                  },
                                  icon: const Icon(
                                    Icons.edit_note_outlined,
                                    color: greenColor,
                                  )),
                              IconButton(
                                  onPressed: () {

                                    showConfirmDialogCustom(
                                      context,
                                      width: 300,
                                      height: 320,
                                      customCenterWidget: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          10.height,
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red
                                                  .withOpacity(0.2),
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: const Icon(
                                              Icons.close,
                                              color:  Colors.red,
                                              size: 40,
                                            ),
                                          ),
                                          10.height,
                                          Text('${e.vehicle?.name}', style: const TextStyle(color: grey),),
                                          Text('${e.vehicle?.year} | ${e.vehicle?.color}',  style: const TextStyle(color: grey)),
                                          10.height,
                                          Text('VIN: ${e.vehicle?.vinNumber} \nLOT: ${e.vehicle?.lotNumber}',  style: const TextStyle(color: grey)),
                                          10.height,
                                        ],
                                      ),
                                      title: 'Are you sure to delete this item?',
                                      subTitle: 'Delete item will not be recovered!',
                                      dialogType: DialogType.DELETE,
                                      onAccept: (ctx) {

                                        context.read<InventoryBloc>().add(DeleteInventoryEvent(e.inventId));

                                      },
                                      onCancel: (ctx){

                                      }
                                    );

                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: redColor,
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
                                e.cusName.isEmptyOrNull ? e.cusEmail : e.cusName,
                              ),
                              2.height,
                              SelectableText(
                                e.cusCompany.validate(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: () {
                              if ((e.vehicle?.images.length ?? 0) > 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DxImagesDialog(
                                      images: e.vehicle?.images ?? [],
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
                              ),
                            ),
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
                                          return DxImagesDialog(
                                            images: e.shipping?.images ?? [],
                                          );
                                        },
                                      );
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
                                          return DxImagesDialog(
                                            images: e.warehouse?.images ?? [],
                                          );
                                        },
                                      );
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
                      DataCell(
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SelectableText(
                                  '${(e.invoice?.invoiceDate?.toIso8601String().isNotEmpty ?? false) ? formatDateTime(e.invoice?.invoiceDate ?? DateTime(0)) : 'N/A'}'),
                              5.height,
                              SelectableText(
                                  e.invoice?.invoiceNumber.validate(value: 'N/A') ??
                                      'N/A')
                            ],
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Tooltip(
                            message:
                                '${((e.invoice?.invoiceUrl.isEmpty ?? false) || (e.invoice?.invoiceUrl.trim() == 'N/A'.trim())) ? 'Pending' : ''}',
                            child: IconButton(
                              onPressed: () {
                                if (((e.invoice?.invoiceUrl.isNotEmpty ?? false) ||
                                    (e.invoice?.invoiceUrl.trim() ==
                                        'N/A'.trim()))) {
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
                                  color:
                                      ((e.invoice?.invoiceUrl.isEmpty ?? false) ||
                                              (e.invoice?.invoiceUrl.trim() ==
                                                  'N/A'.trim()))
                                          ? redColor
                                          : greenColor),
                            ),
                          ),
                        ),
                      ),
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
                              SelectableText(e.invoice?.invoiceAmountCad
                                      .validate(value: 'N/A') ??
                                  'N/A'),
                              5.height,
                              SelectableText(
                                  e.invoice?.hstAmountCad.validate(value: 'N/A') ??
                                      'N/A')
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
                                  e.towing?.departurePort.validate(value: 'N/A') ??
                                      'N/A'),
                              5.height,
                              SelectableText(
                                  e.towing?.towingCity.validate(value: 'N/A') ?? '')
                            ],
                          ),
                        ),
                      ),
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
                    /*  const DataCell(
                        Center(
                          child: SelectableText(''
                              //'${e.exptShippingDate?.toIso8601String() ?? 'N/A'}',
                              ),
                        ),
                      ),
                      const DataCell(
                        Center(
                          child: SelectableText(''
                              //'${e.exptShippingDate?.toIso8601String() ?? 'N/A'}',
                              ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: SelectableText(
                              e.invoice?.totalAmountAed.validate(value: 'N/A') ??
                                  'N/A'),
                        ),
                      ),
                      const DataCell(
                        Center(
                          child: SelectableText(''
                              //'${e.actArrivalDate?.toIso8601String() ?? 'N/A'}',
                              ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: SelectableText(
                              e.shipping?.offLoadingPort.validate(value: 'N/A') ??
                                  'N/A'),
                        ),
                      ),
                      //const DataCell(SelectableText('1123 AED')),
                      DataCell(
                        Center(
                          child: SelectableText(''
                              // '${e.departurePort.validate(value: 'N/A')}'
                              ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: SelectableText(
                              e.warehouse?.name.validate(value: 'N/A') ?? 'N/A'),
                        ),
                      ),
                      const DataCell(
                        Center(
                          child: SelectableText(''
                              //'${e.actArrivalDate ?? 'N/A'}'
                              ),
                        ),
                      ),
                      const DataCell(
                        Center(child: SelectableText('123455 \$')),
                      ),*/
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
                      // DataCell(
                      //   Center(
                      //     child: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Icons.edit_outlined,
                      //         color: greenColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
