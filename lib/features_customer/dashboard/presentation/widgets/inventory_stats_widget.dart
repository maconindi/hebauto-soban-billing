import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/decorations.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_states.dart';


class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class InventoryStatsWidget extends StatelessWidget {
  const InventoryStatsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration:
      boxDecorationRoundedWithShadow(defaultItemsRadius.toInt()),
      child: BlocBuilder<CustomerDashboardBloc, DashboardState>(
        builder: (context, state) {
          //debugPrint('${state.inventoryStatsEntity.totalCount}');

          final chartData = <ChartData>[
            ChartData(
              'New Created',
              state.inventoryStatsEntity.totalNewCreated.toDouble(),
            ),
            ChartData(
              'Towing',
              state.inventoryStatsEntity.totalTowingCount.toDouble(),
            ),
            ChartData(
              'Warehouse',
              state.inventoryStatsEntity.totalWarehouseCount
                  .toDouble(),
            ),
            ChartData(
              'Shipping',
              state.inventoryStatsEntity.totalShippingCount
                  .toDouble(),
            ),
            ChartData(
              'Store',
              state.inventoryStatsEntity.totalStoreCount
                  .toDouble(),
            ),
            ChartData(
              'Delivered',
              state.inventoryStatsEntity.totalDeliveredCount
                  .toDouble(),
            )
          ];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.directions_bus,
                    color: kPrimaryColor,
                    size: 50,
                  ),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DxText(
                        text: 'Shipments',
                        size: 20,
                      ),
                      10.height,
                      DxText(
                        text:
                        '${state.inventoryStatsEntity.totalCount.toDouble()}',
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SfCircularChart(
                // palette: [
                //   redColor,
                //   blueColor,
                //   greenColor,
                //   magenta
                // ],
                legend: Legend(
                  isVisible: true,
                  //isVisible: context.isPhone() ? false : true,
                  title: const LegendTitle(text: '    '),
                  orientation: LegendItemOrientation.vertical,
                  legendItemBuilder: (title, __, point, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Container(
                            color: point.color,
                            height: 10,
                            width: 10,
                          ).cornerRadiusWithClipRRect(100),
                          20.width,
                          Text('$title  ${(point as ChartPoint).y}'),
                        ],
                      ),
                    );
                  },
                  height: '400',
                  width: '100',
                ),
                series: <CircularSeries>[
                  // Renders radial bar chart
                  RadialBarSeries<ChartData, String>(
                    dataSource: chartData,
                    useSeriesColor: true,
                    trackOpacity: 0.3,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    // dataLabelSettings: const DataLabelSettings(
                    //     isVisible: true,
                    //   textStyle: TextStyle(color: white),
                    //   borderColor: white,
                    //   borderWidth: 1,
                    //   //useSeriesColor: true,
                    //     showZeroValue: false,),
                    // Corner style of radial bar segment
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}