import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hebauto/core/util/constants.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../generated/assets.dart';
import '../../domain/entity/billing_inventory_entity.dart';

class BillingInventoryScreen extends StatefulWidget {
  const BillingInventoryScreen({super.key});

  @override
  State<BillingInventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<BillingInventoryScreen> {
  static const fontSize = 13.0;
  static const lineThickness = 0.5;
  static const doubleColumnWidth = 130.0;

  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

  final controller = ScrollController();

  final viewController = PdfViewerController();

  List<BillingInventoryEntity> inventoryItems = [
    BillingInventoryEntity(
      id: 1,
      view: 'View 1',
      costCode: 'CC001',
      date: DateTime(2024, 4, 1),
      dueDate: DateTime(2024, 4, 15),
      poNumber: 'PO001',
      supplierName: 'Supplier 1',
      carDetails: 'Car 1',
      qtyDelivered: 10,
      account: 'Account 1',
      purchasePriceCAD: 100,
      purchasePriceAED: 300,
      taxCost: 10,
    ),
    BillingInventoryEntity(
      id: 2,
      view: 'View 2',
      costCode: 'CC002',
      date: DateTime(2024, 4, 2),
      dueDate: DateTime(2024, 4, 16),
      poNumber: 'PO002',
      supplierName: 'Supplier 2',
      carDetails: 'Car 2',
      qtyDelivered: 20,
      account: 'Account 2',
      purchasePriceCAD: 200,
      purchasePriceAED: 400,
      taxCost: 20,
    ),
    BillingInventoryEntity(
      id: 23,
      view: 'View 23',
      costCode: 'CC023',
      date: DateTime(2024, 4, 23),
      dueDate: DateTime(2024, 5, 7),
      poNumber: 'PO023',
      supplierName: 'Supplier 23',
      carDetails: 'Car 23',
      qtyDelivered: 230,
      account: 'Account 23',
      purchasePriceCAD: 2300,
      purchasePriceAED: 4600,
      taxCost: 230,
    ),
    BillingInventoryEntity(
      id: 24,
      view: 'View 24',
      costCode: 'CC024',
      date: DateTime(2024, 4, 24),
      dueDate: DateTime(2024, 5, 8),
      poNumber: 'PO024',
      supplierName: 'Supplier 24',
      carDetails: 'Car 24',
      qtyDelivered: 240,
      account: 'Account 24',
      purchasePriceCAD: 2400,
      purchasePriceAED: 4800,
      taxCost: 240,
    ),
  ];

  Future<void> showPdf() async {
    // import 'package:pdf/widgets.dart' as pw;
    // import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
    // import 'package:flutter/services.dart';

    final img = await rootBundle.load(Assets.imagesLogo);
    final imageBytes = img.buffer.asUint8List();

    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.height,
            Container(
              height: 100,
              width: context.width(),
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: kBackgroundColor),
              child: const DxText(
                text: 'Inventory List',
                isBold: true,
                size: 25,
                color: grey,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  15.height,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 400,
                        child: FDTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: TextEditingController(),
                          suffix: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_rounded,
                              color: grey,
                            ),
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'Something is required!';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          decoration: defaultInputDecoration(
                            hint: 'Search vin, customer, invoice',
                            textStyle: const TextStyle(color: grey),
                          ),
                        ),
                      )
                    ],
                  ),

                  Scrollbar(
                    thumbVisibility: true,
                    //always show scrollbar
                    thickness: 10,
                    //width of scrollbar
                    controller: controller,
                    radius: Radius.circular(defaultItemsRadius),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            //width: context.width() - 450,
                            decoration: boxDecorationWithRoundedCorners(),
                            child: DataTable(
                              headingRowHeight: 70,
                              columnSpacing: 20,
                              border: TableBorder.all(
                                  color: grey,
                                  borderRadius: BorderRadius.circular(
                                      defaultItemsRadius)),
                              showBottomBorder: true,
                              columns: [
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('  ',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ).expand(),
                                ),
                                // const DataColumn(
                                //   label: SizedBox.shrink(),
                                // ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('View',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cost Code',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Date',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Due Date',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'PO #',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Supplier Name',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Car Details',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Qty Delivered',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Account',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Purchase Price CAD',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Purchase Price AED',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                                DataColumn(
                                  label: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tax Cost',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: fontSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ).expand(),
                                ),
                              ],
                              rows: inventoryItems
                                  .map((item) => DataRow(cells: [
                                        const DataCell(
                                            Icon(Icons.edit_note_rounded)),
                                        const DataCell(Icon(Icons.credit_card)),
                                        DataCell(Text(item.costCode)),
                                        DataCell(Text(item.date.toString())),
                                        DataCell(Text(item.dueDate.toString())),
                                        DataCell(Text(item.poNumber)),
                                        DataCell(Text(item.supplierName)),
                                        DataCell(Text(item.carDetails)),
                                        DataCell(
                                            Text(item.qtyDelivered.toString())),
                                        DataCell(Text(item.account)),
                                        DataCell(Text(
                                            item.purchasePriceCAD.toString())),
                                        DataCell(Text(
                                            item.purchasePriceAED.toString())),
                                        DataCell(Text(item.taxCost.toString())),
                                      ]))
                                  .toList(),
                            ),
                          ),
                        ),
                        defaultWidgetsVerticalSpacing,
                        defaultWidgetsVerticalSpacing,
                      ],
                    ),
                  ),

                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,

                  NumberPagination(
                    onPageChanged: (int pageNumber) {},
                    threshold: 2,
                    colorPrimary: kPrimaryColor,
                    pageTotal: 12,
                    iconNext: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                    iconPrevious: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_before),
                    ),
                    iconToFirst: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_previous_outlined),
                    ),
                    iconToLast: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_next_outlined),
                    ),
                  ),

                  // FutureBuilder(future: setPageDetails(), builder: (ctx, stx){
                  //
                  //
                  //   if(stx.connectionState == ConnectionState.waiting) {
                  //     return const CircularProgressIndicator();
                  //   }
                  //
                  //   if(stx.connectionState == ConnectionState.done) {
                  //     return Container(
                  //       height: context.height(), width: context.width() / 2,
                  //       child:  Column(
                  //         children: [
                  //
                  //           IconButton(onPressed: viewController.nextPage, icon: const Icon(Icons.navigate_next)),
                  //           IconButton(onPressed: viewController.previousPage, icon: const Icon(Icons.navigate_before)),
                  //           SizedBox(
                  //               height: 700,
                  //               width: 500,
                  //
                  //               child: SfPdfViewer.memory(
                  //
                  //                 controller : viewController,
                  //
                  //
                  //                 stx.data ?? Uint8List(0),scrollDirection:  PdfScrollDirection.horizontal,)),
                  //         ],
                  //       ),);
                  //   }
                  //
                  //   return const Center();
                  // }),

                  // Text('${state.currentPage} / ${state.lastPage}', style:  const TextStyle(fontStyle: FontStyle.italic),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
