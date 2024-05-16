import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../util/colors.dart';
import '../util/config.dart';
import 'dx_text.dart';

class DxRangePicker extends StatelessWidget {
  final String label;
  const DxRangePicker({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DxText(text: label,  size: 14, color: grey,),
          SfRangeSlider(
            min: 0.0,
            max: 100.0,
            values: const SfRangeValues(40.0, 80.0),
            interval: 20,
            activeColor: kPrimaryColor,
            showTicks: false,
            showLabels: false,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (SfRangeValues values) {},
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DxText(text: 'min'),
              DxText(text: 'max')
            ],
          )
        ],
      ),
    );
  }
}
