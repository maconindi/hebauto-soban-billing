import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/decorations.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

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
                text: 'Reports',
                isBold: true,
                size: 25,
                color: grey,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  20.height,

                  /// Container Top 1
                  ///

                  20.height,

                  Container(
                    width: context.width() / 1.5,
                    height: context.height() / 2,
                    decoration: boxDecorationWithRoundedCorners(),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.balance_outlined,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Balance Sheet Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.legend_toggle_sharp,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text
                                    Text(
                                      'Invoice Statement (Profit & Loss Account) Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Invoice Statement (Profit & Loss Account) Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.line_axis_rounded,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Cash Flow Statement Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Cash Flow Statement Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.receipt_long_outlined,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'General Ledger Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'General Ledger Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.square_foot_rounded,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Trail Balance Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Trail Balance Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.percent_rounded,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Tax Transaction Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Tax Transaction Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                          ],
                        ).expand(),
                        const VerticalDivider(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.table_view_outlined,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Sales Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Sales Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.reorder_sharp,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Purchase Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Purchase Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.receipt_outlined,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Account Receivable Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Account Receivable Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.payment,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Account Payable Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Account Payable Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.data_thresholding_outlined,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Inventory Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Inventory Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                            Divider(),
                            GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.people_outline,
                                      color: Colors.grey,
                                    ), // Add an icon
                                    SizedBox(
                                        width:
                                            10), // Add some spacing between the icon and the text

                                    Text(
                                      'Customer Summery Report',
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Text(
                            //   'Customer Summery Report',
                            //   style: TextStyle(color: Colors.blueAccent),
                            // ),
                          ],
                        ).expand()
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
