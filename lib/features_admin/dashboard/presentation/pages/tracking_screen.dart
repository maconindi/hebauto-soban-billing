// import 'package:flutter/material.dart';
//
// import 'package:hebauto/core/util/ext/ext.dart';
//
// import '../../../../core/components/dx_text.dart';
// import '../../../../core/components/fd_textfield.dart';
// import '../../../../core/util/util.dart';
//
// class TrackingScreen extends StatefulWidget {
//   const TrackingScreen({super.key});
//
//   @override
//   State<TrackingScreen> createState() => _TrackingScreenState();
// }
//
// class _TrackingScreenState extends State<TrackingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width() / 1.50,
//       child: Column(
//         children: [
//           defaultWidgetsVerticalSpacing,
//           Icon(
//             Icons.track_changes_rounded,
//             size: 50,
//             color: kPrimaryColor,
//           ),
//           const DxText(
//             text: 'Progress Tracking Update',
//             isBold: true,
//             size: 30,
//             color: black,
//           ),
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           FDTextField(
//             textFieldType: TextFieldType.NAME,
//             controller: TextEditingController(),
//             suffix: Icon(Icons.search, color: kPrimaryColor),
//             validator: (value) {
//               if (value?.isEmpty ?? false) {
//                 return 'Email is required';
//               } else {
//                 return null;
//               }
//             },
//             decoration: defaultInputDecoration(hint: 'Vin Number/Lot Number'),
//           ),
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           Container(
//             height: 170,
//             width: context.width() / 3,
//             decoration:
//                 boxDecorationWithRoundedCorners(backgroundColor: black),
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 10.height,
//                 const DxText(
//                   text: 'Vin Number',
//                   color: Colors.white,
//                   isBold: true,
//                   size: 20,
//                 ),
//                 const DxText(
//                   text: '1561346413145145',
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 20.height,
//                 const DxText(
//                   text: 'Lot Number',
//                   //
//                   color: Colors.white,
//                   isBold: true,
//                   size: 20,
//                 ),
//                 const DxText(
//                   text: '134513251451345',
//                   size: 20,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           defaultWidgetsVerticalSpacing,
//           Container(
//             height: 170,
//             decoration:
//                 boxDecorationWithRoundedCorners(backgroundColor: lightGrey),
//             padding: const EdgeInsets.symmetric(horizontal: 30.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Shipping Created',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Towing',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Warehouse',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Loading Port',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Transit',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Off loading Port',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Warehouse',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   color: grey,
//                   height: 2,
//                 ).expand(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const DxText(
//                       text: '12/12/1223',
//                     ),
//                     5.height,
//                     DxText(
//                       text: 'Delivered',
//                       color: kPrimaryColor,
//                       isBold: true,
//                     ),
//                     5.height,
//                     Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.only(bottom: 40),
//                       decoration: boxDecorationWithRoundedCorners(
//                         backgroundColor: kPrimaryColor,
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Center(
//                         child: Icon(
//                           Icons.check_rounded,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
