import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/ext/context.dart';

import '../../../../core/services/hive/main_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: context.width(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DxText(text: 'Welcome back!' , size: 30, color: white,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DxText(text: '${MainBoxMixin.mainBox?.get(MainBoxKeys.name.name)}'.toUpperCase() , size: 30, color: white,),
                  DxText(text: '${MainBoxMixin.mainBox?.get(MainBoxKeys.email.name)}'.toLowerCase() , size: 30, color: white,),
                ],
              ),




            ],
          )

        ],
      ),

    );
  }
}
