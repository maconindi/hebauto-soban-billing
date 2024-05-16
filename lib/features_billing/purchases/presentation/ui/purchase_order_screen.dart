import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_to_pdf/export_delegate.dart';
import 'package:hebauto/core/components/fd_button.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/generated/assets.dart';
import 'package:worker_manager/worker_manager.dart';

import '../../../../core/components/dx_date_picker.dart';
import '../../../../core/components/dx_text.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/decorations.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class PurchaseOrderScreen extends StatefulWidget {
  const PurchaseOrderScreen({super.key});

  @override
  State<PurchaseOrderScreen> createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {
  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

  // final ExportDelegate exportDelegate = ExportDelegate(
  //     options: const ExportOptions(pageFormatOptions: PageFormatOptions.a4()));

  Future<void> saveFile(document, String name) async {
    // try {
    //   final Directory dir = await getApplicationDocumentsDirectory();
    //   final File file = File('${dir.path}/$name.pdf');
    //
    //   await file.writeAsBytes(await document.save());
    //   debugPrint('Saved exported PDF at: ${file.path}');
    // } on Exception catch (e) {
    //   debugPrint('This is the excception >> ${e.toString()}');
    // }
  }

  // Future<void> download(
  //   List<int> bytes, {
  //   String downloadName = 'invoice.pdf',
  // }) async {
  //   log('>> 1');
  //   // Encode our file in base64
  //   final _base64 = base64Encode(bytes);
  //   // Create the link with the file
  //   log('>> 2');
  //   final anchor =
  //       AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
  //         ..target = 'blank';
  //
  //   log('>> 3');
  //   // add the name
  //   if (downloadName != null) {
  //     anchor.download = downloadName;
  //   }
  //
  //   log('>> 4');
  //   // trigger download
  //   document.body?.append(anchor);
  //   anchor.click();
  //   anchor.remove();
  //
  //   log('>> 5');
  //   //return;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Container(
          //color: Colors.red,
          //alignment: Alignment.topCenter,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              20.height,

              /// Container Top 1
              ///
              Container(
                height: 100,
                width: context.width(),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: kBackgroundColor),
                child: const DxText(
                  text: 'New Purchase Invoice',
                  isBold: true,
                  size: 25,
                  color: grey,
                ),
              ),

              kVerticalSpaces,

              Container(
                //height: context.height(),
                width: context.width(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: kBackgroundColor),

                child: Column(
                  children: [
                    10.height,

                    Row(
                      children: [
                        FDTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: TextEditingController(),
                          decoration: defaultInputDecoration(label: 'Date'),
                          readOnly: true,
                          suffix: const Icon(Icons.calendar_month_outlined),
                          onTap: () {
                            showDxDatePicker(context,
                                onDateSelected: (date, strDate) {
                              setState(() {
                                // invoiceDate = date;
                                // invoiceDateController.text = formatDateTime(date);
                              });
                            });
                          },
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Cost Code'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(label: 'PO #'),
                        ).expand(),
                        const SizedBox(
                          height: 1,
                        ).expand(flex: 4)
                      ],
                    ),
                    kVerticalSpaces,
                    Row(
                      children: [
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Supplier Name'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Items Name'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Income Account'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Expense Account'),
                        ).expand(),
                      ],
                    ),
                    kVerticalSpaces,
                    Row(
                      children: [
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(label: 'Ord Qty'),
                        ).expand(),

                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Qty Delivered'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(
                              label: 'Purchase Unit Price'),
                        ).expand(),
                        // FDTextField(
                        //   controller: TextEditingController(),
                        //   textFieldType: TextFieldType.NAME,
                        //   decoration:
                        //   defaultInputDecoration(label: 'Purchase Unit Price'),
                        // ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration:
                              defaultInputDecoration(label: 'Sales Unit Price'),
                        ).expand(),
                        // FDTextField(
                        //   controller: TextEditingController(),
                        //   textFieldType: TextFieldType.NAME,
                        //   decoration:
                        //   defaultInputDecoration(label: 'Expense Account'),
                        // ).expand(),
                      ],
                    ),
                    kVerticalSpaces,
                    Row(
                      children: [
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(label: 'Tax Code'),
                        ).expand(),
                        FDTextField(
                          controller: TextEditingController(),
                          textFieldType: TextFieldType.NAME,
                          decoration: defaultInputDecoration(label: 'Amount'),
                        ).expand(),
                        const SizedBox(
                          height: 1,
                        ).expand(flex: 4)
                      ],
                    ),
                    kVerticalSpaces,

                    Container(
                      height: 70,
                      width: context.width(),
                      decoration: boxDecorationWithRoundedCorners(
                          border: Border.all(color: grey),
                          backgroundColor: Colors.transparent),
                      child: Row(
                        children: [
                          15.width,
                          const Icon(Icons.upload),
                          15.width,
                          DxText(
                            text: 'Choose File',
                            color: kPrimaryColor,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    kVerticalSpaces,
                    kVerticalSpaces,
                    kVerticalSpaces,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () async {
                            ///
                            final img =
                                await rootBundle.load(Assets.imagesLogo);
                            final imageBytes = img.buffer.asUint8List();

                            pw.Image image1 =
                                pw.Image(pw.MemoryImage(imageBytes));

                            List<int> fileInts =
                                List.from(await setPageDetails(image1));

                            html.AnchorElement(
                                href:
                                    'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}')
                              ..setAttribute('download',
                                  '${DateTime.now().microsecondsSinceEpoch}.pdf')
                              ..click();

                            // Cancelable<ResultType> cancelable = workerManager.execute<ResultType>(
                            //       () async {
                            //         /// Your CPU-intensive function here
                            //         ///
                            //         ///
                            //         final img = await rootBundle.load(Assets.imagesLogo);
                            //         final imageBytes = img.buffer.asUint8List();
                            //
                            //         pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
                            //
                            //
                            //
                            //
                            //         try {
                            //           List<int> fileInts = List.from(await setPageDetails(image1));
                            //           html.AnchorElement(
                            //               href:
                            //               'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}')
                            //             ..setAttribute('download',
                            //                 '${DateTime.now().millisecondsSinceEpoch}.pdf')
                            //             ..click();
                            //         } on Exception catch (e) {
                            //          debugPrint('The crash is here now ${e.toString()}');
                            //         }
                            //
                            //         return ResultType.done;
                            //
                            //         //return setPageDetails(image1);
                            //
                            //
                            //
                            //
                            //         //return ResultType.done;
                            //   },
                            //   priority: WorkPriority.regular,
                            // );

                            //setPageDetails();

                            //cancelable.cancel();

                            //
                            // log('>> -1');
                            // final ExportOptions overrideOptions = ExportOptions(
                            //   textFieldOptions: TextFieldOptions.uniform(
                            //     interactive: false,
                            //   ),
                            //   checkboxOptions: CheckboxOptions.uniform(
                            //     interactive: false,
                            //   ),
                            // );
                            //
                            // log('>> -2');
                            // final pdf = await exportDelegate.exportToPdfDocument('demo',
                            //     overrideOptions: overrideOptions);
                            //
                            // log('>> 0');
                            //
                            // await download(await pdf.document.save());
                            //saveFile(pdf, 'static-example');
                          },
                          child: const Row(
                            children: [
                              Text('Export as static'),
                              Icon(Icons.save_alt_outlined),
                            ],
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () async {
                        //     final pdf = await exportDelegate.exportToPdfDocument('demo');
                        //
                        //     log('>> 0');
                        //     await download(await pdf.document.save());
                        //   },
                        //   child: const Row(
                        //     children: [
                        //       Text('Export as interactive'),
                        //       Icon(Icons.save_alt_outlined),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),

                    // ExportFrame(
                    //   frameId: 'taxInvoice',
                    //   //pageFormatOptions: PageFormatOptions.a3(),
                    //   exportDelegate: ExportDelegate(options: const ExportOptions(pageFormatOptions: PageFormatOptions.a4() )),
                    //   child: const TaxInvoicePDF(), // the widget you want to export
                    // ),

                    FDButton(
                      width: context.width(),
                      text: 'Publish',
                      onTap: () async {
                        // create instance of ExportDelegate
                        final ExportDelegate exportDelegate = ExportDelegate();

                        // ExportFrame(
                        //   frameId: 'taxInvoice',
                        //   //pageFormatOptions: PageFormatOptions.a3(),
                        //   exportDelegate: ExportDelegate(options: const ExportOptions(pageFormatOptions: PageFormatOptions.a4() )),
                        //   child: const TaxInvoicePDF(), // the widget you want to export
                        // );

// export the frame to a PDF Document
                        final pdf = await exportDelegate
                            .exportToPdfDocument('taxInvoice');
                      },
                    ),

                    // ExportFrame(
                    //   frameId: 'demo',
                    //   exportDelegate: exportDelegate,
                    //   child: const QuestionnaireExample(),
                    // )
                  ],
                ),
              ),

              50.height,

              // SizedBox(width: 50,).expand()

              // Container().expand()
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> setPageDetails(pw.Image logo) async {
    final pdf = pw.Document();


    final page = pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        header: (pw.Context context){


          return pw.Column(
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text('Tax Invoice',
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.SizedBox(height: 100, width: 300, child: logo)
                  ]),
              pw.SizedBox(height: 20),
              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Payable AED 6,6000.00',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Dues 15/08/2023',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Issued 01/08/2023',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Inv #INV-057',
                                style: const pw.TextStyle(fontSize: 9)),
                          ]),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('From',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Heb Auto Group LTD.',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Al Sama building Al barsha',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Dubai, UAW',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('TAX ID 00XXXXXXXX23123XXX',
                                style: const pw.TextStyle(fontSize: 9)),
                          ]),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Billed To',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Al Ahmari Used Cars LLC.',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Sharjah, UAE',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Issued 01/08/2023',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('+971-123-4567',
                                style: const pw.TextStyle(fontSize: 9)),
                          ]),
                    ),
                    // pw.SizedBox(width: 10),
                    // pw.Expanded(
                    //   child: pw.SizedBox(),
                    // ),
                  ]),
              pw.SizedBox(height: 20),

              pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),

              pw.SizedBox(height: 20),
            ]
          );

        },
        footer: (pw.Context context){

          return pw.Column(
            children: [
              pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),

              pw.SizedBox(height: 20),



              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(
                      width: 2,
                      height: 40,
                      margin: const pw.EdgeInsets.only(right: 10),
                      color: const PdfColor.fromInt(808080),
                    ),


                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text('Payment Details',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Please pay within 15 days of receiving this invoice.',
                                style: const pw.TextStyle(fontSize: 9)),
                            // pw.SizedBox(height: 5),
                            // pw.Text('Issued 01/08/2023',
                            //     style: const pw.TextStyle(fontSize: 9)),
                            // pw.SizedBox(height: 5),
                            // pw.Text('Inv #INV-057',
                            //     style: const pw.TextStyle(fontSize: 9)),
                          ]),
                    ),
                    //pw.SizedBox(width: 10),
                    // pw.Expanded(
                    //   child: pw.Column(
                    //       crossAxisAlignment: pw.CrossAxisAlignment.start,
                    //       children: [
                    //         pw.Text('From',
                    //             style: pw.TextStyle(
                    //                 fontWeight: pw.FontWeight.bold, fontSize: 9)),
                    //         pw.SizedBox(height: 5),
                    //         pw.Text('Heb Auto Group LTD.',
                    //             style: const pw.TextStyle(fontSize: 9)),
                    //         pw.SizedBox(height: 5),
                    //         pw.Text('Al Sama building Al barsha',
                    //             style: const pw.TextStyle(fontSize: 9)),
                    //         pw.SizedBox(height: 5),
                    //         pw.Text('Dubai, UAW',
                    //             style: const pw.TextStyle(fontSize: 9)),
                    //         pw.SizedBox(height: 5),
                    //         pw.Text('TAX ID 00XXXXXXXX23123XXX',
                    //             style: const pw.TextStyle(fontSize: 9)),
                    //       ]),
                    // ),
                    //pw.SizedBox(width: 10),
                    pw.Expanded(
                      child: pw.Column(
                        //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Bank name' , style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                              pw.Text('ADCB' , style: const pw.TextStyle(fontSize: 9)),

                            ]
                          ), pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('IFS Code' , style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                              pw.Text('ABCDXXXXXXS' , style: const pw.TextStyle(fontSize: 9)),

                            ]
                          ), pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Swift Code' , style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                              pw.Text('ADCBUSB902813' , style: const pw.TextStyle(fontSize: 9)),

                            ]
                          ), pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Account#' , style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                              pw.Text(' 4568454 31345123' , style: const pw.TextStyle(fontSize: 9)),

                            ]
                          ),

                        ]
                      ),
                    ),

                  ]),

              pw.SizedBox(height: 20),

              pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [

                    pw.Container(
                      width: 2,
                      height: 10,
                      margin: const pw.EdgeInsets.only(right: 10),
                      color: const PdfColor.fromInt(808080),
                    ),

                    pw.Expanded(
                      child: pw.Text('Thanks for the business', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                    ),

                    pw.Expanded(
                      child:pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('info@hebautogroup.com' , style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.Text('+971 54 475 0584' , style: const pw.TextStyle(fontSize: 9)),

                          ]
                      ),
                    ),

                  ]),


            ]

          );
        },
        build: (pw.Context context) {
          return  [

            /// Items Table
            ///
            ///

            pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 10),
              child:  pw.Column(
                children: [


                  pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('Items Description',style :pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                            flex: 2,
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('Qty',style : pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('Unit Price',style : pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('Price',style : pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                          ),
                        ],
                      )
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('CAPRICE ENGINE', style: const pw.TextStyle(fontSize: 9))),
                            flex: 2,
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('1', style: const pw.TextStyle(fontSize: 9))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('8,000.00', style: const pw.TextStyle(fontSize: 9))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('8,000.00', style: const pw.TextStyle(fontSize: 9))),
                          ),
                        ],
                      )
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('GMC YUKON', style: const pw.TextStyle(fontSize: 9))),
                            flex: 2,
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('1', style: const pw.TextStyle(fontSize: 9))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('45,990.00', style: const pw.TextStyle(fontSize: 9))),
                          ),
                          pw.Expanded(
                            child: pw.Container(alignment: pw.Alignment.center, child: pw.Text('45,990.00', style: const pw.TextStyle(fontSize: 9))),
                          ),
                        ],
                      )
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),

                  pw.Row(
                      children: [
                        pw.Expanded(
                            child: pw.Container(
                              //width:context.width()
                            )
                        ),

                        pw.Expanded(
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [

                                  pw.SizedBox(height: 10),
                                  pw.Text('Subtotal', style: const pw.TextStyle(fontSize: 9)),
                                  pw.SizedBox(height: 10),
                                  pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                                  pw.SizedBox(height: 10),

                                  pw.Row(
                                    children: [
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('Tax', style: const pw.TextStyle(fontSize: 9))),
                                        flex: 2,
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('5%', style: const pw.TextStyle(fontSize: 9))),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('2,699.9', style: const pw.TextStyle(fontSize: 9))),
                                      ),
                                    ],
                                  ),
                                  pw.SizedBox(height: 10),
                                  pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                                  pw.SizedBox(height: 10),

                                  pw.Row(
                                    children: [
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('Total', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                                        flex: 2,
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('54,016 AED', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold))),
                                      ),
                                    ],
                                  ),


                                ]
                            )
                        ),

                      ]
                  )


                ],
              ),
            ),








            // pw.Data
          ]; // Center
        });

    //pdf.addPage(page);

    final exe = workerManager.execute<Uint8List>(() async {
      debugPrint('>> 1');
      pdf.addPage(page);
      debugPrint('>> 2');
      return await pdf.save();
    }, priority: WorkPriority.highRegular);

    // Future.delayed(Duration(milliseconds: 500), (){
    //
    // });

    //pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));

    //return await pdf.save();

    debugPrint('>> 3');

    return await exe.future;
  }
}
