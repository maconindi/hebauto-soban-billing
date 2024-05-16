import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:lottie/lottie.dart';

class EmptyPage extends StatelessWidget {
  final String pageName;

  const EmptyPage({super.key, this.pageName = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            //height: 100,
            width: context.width()/2,
            child: Lottie.asset('assets/anim/construction1.json',
                fit: BoxFit.fill)),
        10.height,
        DxText(
          text: '$pageName is under construction.',
          size: 30,
          color: kPrimaryColor,
        )
      ],
    );
  }
}
