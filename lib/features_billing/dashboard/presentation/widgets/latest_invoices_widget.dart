import 'package:flutter/material.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../domain/entity/lastest_invoices_entity.dart';

class LatestInvoicesWidget extends StatefulWidget {
  const LatestInvoicesWidget({super.key});

  @override
  State<LatestInvoicesWidget> createState() => _LatestInvoicesWidgetState();
}

class _LatestInvoicesWidgetState extends State<LatestInvoicesWidget> {

  final color = Colors.transparent;

  List<LatestInvoiceEntity> invoices = [
    LatestInvoiceEntity(
      invoiceId: 'INV001',
      status: 'Paid',
      amount: 500,
      carDetails: 'Honda Civic',
      customerName: 'Alice Johnson',
      billingDate: '2023-01-01',
    ),
    LatestInvoiceEntity(
      invoiceId: 'INV002',
      status: 'Pending',
      amount: 750,
      carDetails: 'Ford Mustang',
      customerName: 'Bob Smith',
      billingDate: '2023-01-02',
    ),
    LatestInvoiceEntity(
      invoiceId: 'INV003',
      status: 'Paid',
      amount: 1200,
      carDetails: 'Tesla Model 3',
      customerName: 'Eve Brown',
      billingDate: '2023-01-03',
    ),
    LatestInvoiceEntity(
      invoiceId: 'INV004',
      status: 'Pending',
      amount: 900,
      carDetails: 'Chevrolet Malibu',
      customerName: 'David Lee',
      billingDate: '2023-01-04',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: Center(
                    child: SelectableText(
                      'Invoice ID',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      focusNode: FocusNode(),
                      //overflow: TextOverflow.ellipsis
                    ),
                  ),
                ).expand(),
                5.width,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: const Center(
                    child: Text(
                      'Billing Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ).expand(),
                1.width,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: const Center(
                    child: Text(
                      'Customer Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ).expand(),
                1.width,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: const Center(
                    child: Text(
                      'Car Details',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ).expand(),
                1.width,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: const Center(
                    child: Text('Amount',
                        style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ).expand(),
                1.width,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: color),
                  child: const Center(
                    child: Text('Status',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ).expand(),
              ],
            ),
            ...invoices.map((e) => Container(
              decoration: boxDecorationWithRoundedCorners(),
              margin: const EdgeInsets.symmetric(vertical: 3,),
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child: Center(
                      child: SelectableText(
                        e.invoiceId,
                        focusNode: FocusNode(),
                      ),
                    ),
                  ).expand(),
                  5.width,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child:  Center(
                      child: Text(
                        e.billingDate,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ).expand(),
                  1.width,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child: Center(
                      child: Text(
                        e.customerName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ).expand(),
                  1.width,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child: Center(
                      child: Text(
                        e.carDetails,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ).expand(),
                  1.width,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child: Center(
                      child: Text('${e.amount.toString()} AED'
                      ),
                    ),
                  ).expand(),
                  1.width,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    child:  Center(
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: boxDecorationWithRoundedCorners( backgroundColor: e.status == 'Paid' ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),),
                        child: Center(
                          child: Text(e.status, style: TextStyle( color: e.status == 'Paid' ? Colors.green : Colors.red,),
                          ),
                        ),
                      ),
                    ),
                  ).expand(),
                ],
              ),
            ))


          ],
        ),
      ),
    );
  }
}
