import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_text.dart';
import '../../../../core/util/colors.dart';
import '../../../../generated/assets.dart';

class InventorySummeryWidget extends StatefulWidget {
  const InventorySummeryWidget({super.key});

  @override
  State<InventorySummeryWidget> createState() => _InventorySummeryWidgetState();
}

class _InventorySummeryWidgetState extends State<InventorySummeryWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Column(
                children: [
                  const SizedBox(
                      height: 30,
                      width: 30,
                      child: DxImage(url: Assets.iconsQuantity)),
                  const DxText(
                    text: '868',
                    isBold: true,
                    size: 15,
                  ),
                  5.width,
                  const DxText(
                    text: 'Total Cars Ordered',
                  ),
                ],
              ),

              Column(

                children: [
                  const DxText(text: '+23%', isBold: true, size: 15, color: greenColor,),
                  5.width,
                  const DxText(text: 'this month',)
                ],
              )
            ],
          ),
        ).expand(),
        Container(
          height: 60,
          color: grey.withOpacity(0.2),
          width: 3,
        ),
        Container(
          height: 70,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(
                      height: 30,
                      width: 30,
                      child: DxImage(url: Assets.iconsOntheway)),
                  const DxText(
                    text: '200',
                    isBold: true,
                    size: 15,
                  ),
                  5.width,
                  const DxText(
                    text: 'Total Received',
                  ),
                ],
              ),
              Column(

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
