import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/int.dart';
import 'package:hebauto/core/util/ext/widget.dart';

import 'dx_text.dart';

class SlideBarItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const SlideBarItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.lightBlue,),
            10.width,
            DxText(text: text , size: 15, align: TextAlign.start).expand()
          ],
        ),
      ),
    );
  }
}