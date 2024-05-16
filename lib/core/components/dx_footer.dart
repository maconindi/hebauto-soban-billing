
import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/int.dart';

import '../util/colors.dart';
import '../util/config.dart';
import '../util/ext/widget.dart';
import 'dx_text.dart';

class DxFooter extends StatelessWidget {
  const DxFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      color: kPrimaryColor,
      child: Row(
        children: [
          Container().expand(),
          // Container(
          //   alignment: Alignment.center,
          //   child:  Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const DxText(text: 'Our Company' , isBold: true, color: white, size: 15,),
          //       10.height,
          //       const DxText(text: 'About us' , color: white , size: 15,),
          //       const DxText(text: 'Career' , color: white, size: 15,),
          //
          //     ],
          //   ),
          // ).expand(),
          Container(
            alignment: Alignment.center,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DxText(text: 'OUR COMPANY' , isBold: true, color: white, size: 15,),
                10.height,
                const DxText(text: 'About Us' , color: white , size: 15,),
                const DxText(text: 'Career' , color: white, size: 15,),

              ],
            ),

          ).expand(),
          Container(
            alignment: Alignment.center,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DxText(text: 'NEW CUSTOMERS' , isBold: true, color: white, size: 15,),
                10.height,
                const DxText(text: 'Create Account' , color: white , size: 15,),
                const DxText(text: 'New Customer Center' , color: white, size: 15,),
                const DxText(text: 'Help Center' , color: white, size: 15,),

              ],
            ),
          ).expand(),
          Container(
            alignment: Alignment.center,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DxText(text: 'LEGAL' , isBold: true, color: white, size: 15,),
                10.height,
                const DxText(text: 'Terms Of Use' , color: white , size: 15,),
                const DxText(text: 'Privacy And Data Protection' , color: white, size: 15, align: TextAlign.start,),
                const DxText(text: 'Cookies Policy' , color: white, size: 15,),

              ],
            ),
          ).expand(),

          Container().expand()

        ],
      ),
    );
  }
}