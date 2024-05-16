import 'package:flutter/material.dart';
import 'package:hebauto/core/util/config.dart';
import 'package:hebauto/core/util/decorations.dart';

import '../util/colors.dart';
import '../util/text_styles.dart';

class DxText extends StatelessWidget {
  final String text;
  final int size;
  final bool isParagraph;
  final bool isBold;
  final TextAlign align;
  final Color color;
  final bool isMobileHeading;

  const DxText(
      {super.key,
      required this.text,
      this.size = 10,
      this.isMobileHeading = false,
      this.isParagraph = false,
      this.isBold = false,
      this.color = blackColor,
      this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isMobileHeading
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 10)
          : EdgeInsets.zero,
      decoration: isMobileHeading
          ? boxDecorationWithRoundedCorners(backgroundColor: kPrimaryColor)
          : null,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        style: isBold
            ? boldTextStyle(
                color: isMobileHeading ? white: color,
                // fontFamily:
                //     isParagraph ? FontFamily.poppins : FontFamily.montserrat,
                size: size,
              )
            : primaryTextStyle(
                color: color,
                // fontFamily:
                //     isParagraph ? FontFamily.poppins : FontFamily.montserrat,
                size: size,
              ),
      ),
    );
  }
}
