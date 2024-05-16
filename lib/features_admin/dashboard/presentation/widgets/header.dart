import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/ext/context.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: context.width(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: kPrimaryColor,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DxText(text: 'Welcome back!' , size: 30, color: white,)
          
        ],
      ),

    );
  }
}
