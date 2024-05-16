
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:worker_manager/worker_manager.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../core/util/common.dart';
import '../../../../generated/assets.dart';
import '../../domain/usecase/purchases_usecase.dart';







/// ////////////////////////////////////////////////////////////////////
///
///
///
///
///
///
///
///
///
///
///
/// ///////////////////////////////////////////////////////////////////

/// final img =
///     await rootBundle.load(Assets.imagesLogo);
/// final imageBytes = img.buffer.asUint8List();
///
/// pw.Image image1 =
/// pw.Image(pw.MemoryImage(imageBytes));
///
/// List<int> fileInts =
/// List.from(await setPageDetails(image1));
///
/// html.AnchorElement(
/// href:
/// 'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}')
/// ..setAttribute('download',
/// '${DateTime.now().microsecondsSinceEpoch}.pdf')
/// ..click();



String getTaxDeductedPrice (String amount, String quantity, String currency){
  double totalAmountBeforeDeduction = double.tryParse(amount) ?? 0.0;
  final tax = totalAmountBeforeDeduction * 0.05;
  final totalAmount = totalAmountBeforeDeduction - tax;
  return totalAmount.toOneDecimal();
}

String getAllTaxCount(List<double> taxList){
  double sumTax = 0.0;
  taxList.forEach((element) {
    final tax = element * 0.05; /// Only Tax Amount
    sumTax += tax;
  });
  return sumTax.toOneDecimal();
}

String getSumDeductedPrice(List<double> priceList){

  double sum = 0.0;
  priceList.forEach((element) {
    double totalAmountBeforeDeduction = double.tryParse(element.toString()) ?? 0.0;
    final tax = totalAmountBeforeDeduction * 0.05;
    final totalAmount = totalAmountBeforeDeduction - tax;
    sum += totalAmount;
  });
  return sum.toOneDecimal();
}
String getTotalAmountCount(List<double> taxList){
  double sum = 0.0;
  taxList.forEach((element) {
    //final tax = element * 0.05; /// Only Tax Amount
    sum += element;
  });
  return sum.toOneDecimal();
}


Future<Uint8List> setPageDetails(AddPurchasesParams params) async {
  List<double> priceList = params.items?.map((e) => e.totalPrice.toDouble()).toList() ?? [];


  final img =
  await rootBundle.load(Assets.imagesLogo);
  final imageBytes = img.buffer.asUint8List();
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
                      child: pw.Text('Purchase Tax Invoice',
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold)),
                    ),
                    pw.SizedBox(height: 100, width: 300, child:  pw.Image(pw.MemoryImage(imageBytes)))
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
                            pw.Text('Payable ${getTotalAmountCount(priceList)} AED',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold, fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Issued  ${formatDateTime(params.issueDate ?? DateTime(0))}',
                                style: const pw.TextStyle(fontSize: 9)),

                            pw.SizedBox(height: 5),
                            pw.Text('Due ${formatDateTime(params.dueDate ?? DateTime(0))}',
                                style: const pw.TextStyle(fontSize: 9)),

                            pw.SizedBox(height: 5),
                            pw.Text('PO-${params.itemId.toUpperCase()}',
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
                            pw.Text('Dubai, UAE',
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
                            pw.Text(params.supplierName,
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            pw.Text('Sharjah, UAE',
                                style: const pw.TextStyle(fontSize: 9)),
                            pw.SizedBox(height: 5),
                            // pw.Text('${params.issueDate}',
                            //     style: const pw.TextStyle(fontSize: 9)),
                            // pw.SizedBox(height: 5),
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

              pw.SizedBox(height: 10),
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
                          ]),
                    ),

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
          pw.Container(
            //padding: const pw.EdgeInsets.symmetric(horizontal: 10),
            child:  pw.Column(
              children: [


                pw.Container(
                    //padding: const pw.EdgeInsets.symmetric(horizontal: 10),
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
                pw.Container(
                   // padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                    child: pw.Column(
                      children: [

                        pw.SizedBox(height: 10),
                        pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                        pw.SizedBox(height: 10),
                        ...?params.items?.map((e) => pw.Column(
                          children: [
                            pw.Row(
                              children: [
                                pw.Expanded(
                                  child: pw.Container(alignment: pw.Alignment.center,
                                      child: pw.Column(
                                    children: [
                                      pw.Text(e.details, style: const pw.TextStyle(fontSize: 9)),
                                      pw.SizedBox(height: 5),
                                      pw.Text(e.description, style: const pw.TextStyle(fontSize: 9))
                                    ]
                                  )),
                                  flex: 2,
                                ),
                                pw.Expanded(
                                  child: pw.Container(alignment: pw.Alignment.center, child: pw.Text(e.quantity, style: const pw.TextStyle(fontSize: 9))),
                                ),
                                pw.Expanded(
                                  child: pw.Container(alignment: pw.Alignment.center, child: pw.Text(e.amount, style: const pw.TextStyle(fontSize: 9))),
                                ),
                                pw.Expanded(
                                  child: pw.Container(alignment: pw.Alignment.center, child: pw.Text(getTaxDeductedPrice(e.totalPrice, e.quantity, e.unitPrice), style: const pw.TextStyle(fontSize: 9))),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 10),
                            pw.Divider(height: 2, color: const PdfColor.fromInt(808080)),
                            pw.SizedBox(height: 10),


                          ]
                        ))
                      ]
                    ),
                ),

                pw.SizedBox(height: 10),
                pw.Row(
                    children: [
                      pw.Expanded(
                          child: pw.Container(
                          )
                      ),
                      pw.Expanded(
                          child: pw.Container(
                             // padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [

                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                    children: [
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('Subtotal', style: const pw.TextStyle(fontSize: 9))),
                                        flex: 2,
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('${getSumDeductedPrice(priceList)} AED', style: const pw.TextStyle(fontSize: 9),  textAlign: pw.TextAlign.right)),
                                      ),
                                    ],
                                  ),
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
                                        child: pw.Container(child: pw.Text('${getAllTaxCount(priceList)} AED', style: const pw.TextStyle(fontSize: 9), textAlign: pw.TextAlign.right)),
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
                                        child: pw.Container(),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(child: pw.Text('${getTotalAmountCount(priceList)} AED', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold, ),  textAlign: pw.TextAlign.right)),
                                      ),
                                    ],
                                  ),


                                ]
                            )
                          )
                      ),

                    ]
                )

              ],
            ),
          ),
        ]; // Center
      });

  final exe = workerManager.execute<Uint8List>(() async {
    pdf.addPage(page);
    return await pdf.save();
  }, priority: WorkPriority.highRegular);
  return await exe.future;
}
