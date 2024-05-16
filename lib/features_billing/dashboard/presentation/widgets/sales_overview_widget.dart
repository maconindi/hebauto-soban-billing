import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_image.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/util/colors.dart';
import '../../../../generated/assets.dart';

class SalesOverviewWidget extends StatefulWidget {
  const SalesOverviewWidget({super.key});

  @override
  State<SalesOverviewWidget> createState() => _SalesOverviewWidgetState();
}

class _SalesOverviewWidgetState extends State<SalesOverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          height: 80,
          child:  Column(
            children: [
              
              const SizedBox(
                  height: 30, width:30,
                  child: DxImage(url: Assets.iconsSales)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '32', isBold: true, size: 15,),
                  5.width,
                  const DxText(text: 'Sales',)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '+23', isBold: true, size: 15, color: greenColor,),
                  5.width,
                  const DxText(text: 'this month',)
                ],
              )

            ],
          ),

        ).expand(),
        Container(height: 60, color: grey.withOpacity(0.2), width: 3,),
        Container(
          // color: blueColor,
          height: 80,
          child:  Column(
            children: [

              const SizedBox(
                  height: 30, width:30,
                  child: DxImage(url: Assets.iconsRevenue))
              ,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '18300 AED', isBold: true, size: 15,),
                  5.width,
                  const DxText(text: 'Revenue',)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '-3%', isBold: true, size: 15, color: redColor,),
                  5.width,
                  const DxText(text: 'this month',)
                ],
              )

            ],
          ),
        ).expand(),
        Container(height: 60, color: grey.withOpacity(0.2), width: 3,),
        Container(
          // color: blueViolet,
          height: 80,
          child:  Column(
            children: [

              const SizedBox(
                  height: 30, width:30,
                  child: DxImage(url: Assets.iconsProfit)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '868 AED', isBold: true, size: 15,),
                  5.width,
                  const DxText(text: 'Profit',)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '+23', isBold: true, size: 15, color: greenColor,),
                  5.width,
                  const DxText(text: 'this month',)
                ],
              )

            ],
          ),
        ).expand(),
        Container(height: 60, color: grey.withOpacity(0.2), width: 3,),
        Container(
          //  color: purple,
          height: 80,
          child:  Column(
            children: [

              const SizedBox(
                  height: 30, width:30,
                  child: DxImage(url: Assets.iconsCost)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '17432 AED', isBold: true, size: 15,),
                  5.width,
                  const DxText(text: 'Cost',)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DxText(text: '-3%', isBold: true, size: 15, color: redColor,),
                  5.width,
                  const DxText(text: 'this month',)
                ],
              )

            ],
          ),
        ).expand(),
      ],
    );
  }
}
