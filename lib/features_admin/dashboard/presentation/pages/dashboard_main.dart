import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/decorations.dart';

class PieData {
  PieData(this.xData, this.yData, [this.text]);

  final String xData;
  final num yData;
  String? text;
}

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  int touchedIndex = 0;

  List<PieData> pieData = [
    PieData('Delivered', 30, '180'),
    PieData('In Transit', 70, '215')
  ];

  List<PieData> pieData1 = [
    PieData('Umm Qasr', 30, '180'),
    PieData('Jabel Ali', 70, '215')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              defaultWidgetsVerticalSpacing,
              defaultWidgetsVerticalSpacing,
              Row(
                children: [
                  Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration:
                        boxDecorationWithRoundedCorners(backgroundColor: white),
                    child: Column(
                      children: [
                        defaultWidgetsVerticalSpacing,
                        const DxText(
                          text: 'Customer Outstanding Bills',
                          color: redColor,
                          size: 20,
                          isBold: true,
                        ),
                        defaultWidgetsVerticalSpacing,
                        SizedBox(
                          width: context.width(),
                          child: DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('ID',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Amount',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text('1')),
                                DataCell(Text('Stephen')),
                                DataCell(Text('312312  AED')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('5')),
                                DataCell(Text('John')),
                                DataCell(Text('712312  AED')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('10')),
                                DataCell(Text('Harry')),
                                DataCell(Text('412312  AED')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('15')),
                                DataCell(Text('Peter')),
                                DataCell(Text('912312  AED')),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ).expand(flex: 3),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration:
                        boxDecorationWithRoundedCorners(backgroundColor: white),
                    child: Column(
                      children: [
                        defaultWidgetsVerticalSpacing,
                        const DxText(
                          text: 'Billing Updates',
                          color: lightSkyBlue,
                          size: 20,
                          isBold: true,
                        ),
                        defaultWidgetsVerticalSpacing,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: boxDecorationWithRoundedCorners(
                              border: Border.all(color: grey)),
                          child: Column(
                            children: [
                              const SizedBox(
                                  child: Center(
                                      child: DxText(
                                text: 'Date : 15/02/2023',
                                isBold: true,
                                size: 15,
                              ))).expand(flex: 1),
                              const Divider(
                                color: grey,
                              ),
                              const SizedBox(
                                  child: Center(
                                      child: DxText(
                                text: '124,2546.00 AED',
                                isBold: true,
                                size: 15,
                              ))).expand(flex: 2),
                            ],
                          ),
                        ).expand(),
                        defaultWidgetsVerticalSpacing,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: boxDecorationWithRoundedCorners(
                              border: Border.all(color: grey)),
                          child: Column(
                            children: [
                              const SizedBox(
                                  child: Center(
                                      child: DxText(
                                text: 'Amount Overdue',
                                isBold: true,
                                color: redColor,
                                size: 15,
                              ))).expand(flex: 1),
                              const Divider(
                                color: grey,
                              ),
                              const SizedBox(
                                  child: Center(
                                      child: DxText(
                                text: '124,2546.00 AED',
                                isBold: true,
                                size: 15,
                              ))).expand(flex: 2),
                            ],
                          ),
                        ).expand(),
                        defaultWidgetsVerticalSpacing,
                      ],
                    ),
                  ).expand(flex: 2),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration:
                        boxDecorationWithRoundedCorners(backgroundColor: white),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            defaultWidgetsVerticalSpacing,
                            const DxText(
                              text: 'Delivery Status',
                              color: lightSkyBlue,
                              size: 20,
                              isBold: true,
                            ),
                            SizedBox(
                              height: 100,
                              width: context.width(),
                              child: SfCircularChart(
                                  //title: ChartTitle(text: 'Sales by sales person'),
                                  legend: const Legend(isVisible: true),
                                  series: <PieSeries<PieData, String>>[
                                    PieSeries<PieData, String>(
                                        explode: true,
                                        explodeIndex: 0,
                                        dataSource: pieData,
                                        xValueMapper: (PieData data, _) =>
                                            data.xData,
                                        yValueMapper: (PieData data, _) =>
                                            data.yData,
                                        dataLabelMapper: (PieData data, _) =>
                                            data.text,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true)),
                                  ]),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        Column(
                          children: [
                            defaultWidgetsVerticalSpacing,
                            const DxText(
                              text: 'Delivery Destination',
                              color: lightSkyBlue,
                              size: 20,
                              isBold: true,
                            ),
                            SizedBox(
                              height: 100,
                              width: context.width(),
                              child: SfCircularChart(
                                  //title: ChartTitle(text: 'Sales by sales person'),
                                  legend: const Legend(isVisible: true),
                                  series: <PieSeries<PieData, String>>[
                                    PieSeries<PieData, String>(
                                        explode: true,
                                        explodeIndex: 0,
                                        dataSource: pieData1,
                                        xValueMapper: (PieData data, _) =>
                                            data.xData,
                                        yValueMapper: (PieData data, _) =>
                                            data.yData,
                                        dataLabelMapper: (PieData data, _) =>
                                            data.text,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true)),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).expand(flex: 2),
                ],
              ),
              defaultWidgetsVerticalSpacing,
              defaultWidgetsVerticalSpacing,
              Container(
                height: 350,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: context.width(),
                decoration:
                    boxDecorationWithRoundedCorners(backgroundColor: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    defaultWidgetsVerticalSpacing,
                    const DxText(
                      text: 'Customer Latest Transactions',
                      color: lightSkyBlue,
                      size: 20,
                      isBold: true,
                    ),
                    defaultWidgetsVerticalSpacing,
                    DataTable(
                      columns: const [
                        DataColumn(
                            label: Text('ID',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                        DataColumn(
                            label: Text('VIN Number',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                        DataColumn(
                            label: Text('Car Details',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                        DataColumn(
                            label: Text('Customer Name',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                        DataColumn(
                            label: Text('Shipping Amount',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                        DataColumn(
                            label: Text('Status',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis))),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(Text('1')),
                            DataCell(Text('12345')),
                            DataCell(Text('Toyota Camry')),
                            DataCell(Text('John Doe')),
                            DataCell(Text('\$50.00')),
                            DataCell(Text('Delivered')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('2')),
                            DataCell(Text('67890')),
                            DataCell(Text('Honda Civic')),
                            DataCell(Text('Jane Smith')),
                            DataCell(Text('\$40.00')),
                            DataCell(Text('Towing')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('3')),
                            DataCell(Text('54321')),
                            DataCell(Text('Ford Mustang')),
                            DataCell(Text('Alice Johnson')),
                            DataCell(Text('\$60.00')),
                            DataCell(Text('Warehouse')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('4')),
                            DataCell(Text('98765')),
                            DataCell(Text('Chevrolet Silverado')),
                            DataCell(Text('Bob Brown')),
                            DataCell(Text('\$55.00')),
                            DataCell(Text('Delivered')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('5')),
                            DataCell(Text('24680')),
                            DataCell(Text('Nissan Altima')),
                            DataCell(Text('Emily Davis')),
                            DataCell(Text('\$45.00')),
                            DataCell(Text('Warehouse')),
                          ],
                        ),
                      ],
                    ).expand()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
