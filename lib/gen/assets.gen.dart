// /// GENERATED CODE - DO NOT MODIFY BY HAND
// /// *****************************************************
// ///  FlutterGen
// /// *****************************************************
//
// // coverage:ignore-file
// // ignore_for_file: type=lint
// // ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use
//
// import 'package:flutter/widgets.dart';
//
// class $AssetsAnimGen {
//   const $AssetsAnimGen();
//
//   /// File path: assets/anim/construction1.json
//   String get construction1 => 'assets/anim/construction1.json';
//
//   /// File path: assets/anim/construction2.json
//   String get construction2 => 'assets/anim/construction2.json';
//
//   /// List of all assets
//   List<String> get values => [construction1, construction2];
// }
//
// class $AssetsFontsGen {
//   const $AssetsFontsGen();
//
//   /// File path: assets/fonts/Montserrat-Regular.ttf
//   String get montserratRegular => 'assets/fonts/Montserrat-Regular.ttf';
//
//   /// File path: assets/fonts/Poppins-Regular.ttf
//   String get poppinsRegular => 'assets/fonts/Poppins-Regular.ttf';
//
//   /// File path: assets/fonts/Roboto-Regular.ttf
//   String get robotoRegular => 'assets/fonts/Roboto-Regular.ttf';
//
//   /// List of all assets
//   List<String> get values => [montserratRegular, poppinsRegular, robotoRegular];
// }
//
// class $AssetsIconsGen {
//   const $AssetsIconsGen();
//
//   /// File path: assets/icons/appstore.png
//   AssetGenImage get appstore =>
//       const AssetGenImage('assets/icons/appstore.png');
//
//   /// File path: assets/icons/imageplaceholder.png
//   AssetGenImage get imageplaceholder =>
//       const AssetGenImage('assets/icons/imageplaceholder.png');
//
//   /// File path: assets/icons/nolistingsicon.png
//   AssetGenImage get nolistingsicon =>
//       const AssetGenImage('assets/icons/nolistingsicon.png');
//
//   /// File path: assets/icons/playstore.webp
//   AssetGenImage get playstore =>
//       const AssetGenImage('assets/icons/playstore.webp');
//
//   /// List of all assets
//   List<AssetGenImage> get values =>
//       [appstore, imageplaceholder, nolistingsicon, playstore];
// }
//
// class $AssetsImagesGen {
//   const $AssetsImagesGen();
//
//   $AssetsImagesBannersGen get banners => const $AssetsImagesBannersGen();
//   $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
//
//   /// File path: assets/images/favicon.png
//   AssetGenImage get logo => const AssetGenImage('assets/images/favicon.png');
//
//   /// List of all assets
//   List<AssetGenImage> get values => [logo];
// }
//
// class $AssetsImagesBannersGen {
//   const $AssetsImagesBannersGen();
//
//   /// File path: assets/images/banners/banner_listing_bg.png
//   AssetGenImage get bannerListingBg =>
//       const AssetGenImage('assets/images/banners/banner_listing_bg.png');
//
//   /// File path: assets/images/banners/banner_login.png
//   AssetGenImage get bannerLogin =>
//       const AssetGenImage('assets/images/banners/banner_login.png');
//
//   /// File path: assets/images/banners/banner_top.png
//   AssetGenImage get bannerTop =>
//       const AssetGenImage('assets/images/banners/banner_top.png');
//
//   /// File path: assets/images/banners/login_banner.jpg
//   AssetGenImage get loginBanner =>
//       const AssetGenImage('assets/images/banners/login_banner.jpg');
//
//   /// File path: assets/images/banners/price_listing_banner.png
//   AssetGenImage get priceListingBanner =>
//       const AssetGenImage('assets/images/banners/price_listing_banner.png');
//
//   /// List of all assets
//   List<AssetGenImage> get values => [
//         bannerListingBg,
//         bannerLogin,
//         bannerTop,
//         loginBanner,
//         priceListingBanner
//       ];
// }
//
// class $AssetsImagesIconsGen {
//   const $AssetsImagesIconsGen();
//
//   /// File path: assets/images/icons/checkmark.png
//   AssetGenImage get checkmark =>
//       const AssetGenImage('assets/images/icons/checkmark.png');
//
//   /// File path: assets/images/icons/checkmark_2.png
//   AssetGenImage get checkmark2 =>
//       const AssetGenImage('assets/images/icons/checkmark_2.png');
//
//   /// File path: assets/images/icons/funnel_1.png
//   AssetGenImage get funnel1 =>
//       const AssetGenImage('assets/images/icons/funnel_1.png');
//
//   /// File path: assets/images/icons/preorder_1.png
//   AssetGenImage get preorder1 =>
//       const AssetGenImage('assets/images/icons/preorder_1.png');
//
//   /// File path: assets/images/icons/restricted_area_1.png
//   AssetGenImage get restrictedArea1 =>
//       const AssetGenImage('assets/images/icons/restricted_area_1.png');
//
//   /// File path: assets/images/icons/time_1.png
//   AssetGenImage get time1 =>
//       const AssetGenImage('assets/images/icons/time_1.png');
//
//   /// File path: assets/images/icons/transaction_history_1.png
//   AssetGenImage get transactionHistory1 =>
//       const AssetGenImage('assets/images/icons/transaction_history_1.png');
//
//   /// List of all assets
//   List<AssetGenImage> get values => [
//         checkmark,
//         checkmark2,
//         funnel1,
//         preorder1,
//         restrictedArea1,
//         time1,
//         transactionHistory1
//       ];
// }
//
// class Assets {
//   Assets._();
//
//   static const $AssetsAnimGen anim = $AssetsAnimGen();
//   static const $AssetsFontsGen fonts = $AssetsFontsGen();
//   static const $AssetsIconsGen icons = $AssetsIconsGen();
//   static const $AssetsImagesGen images = $AssetsImagesGen();
// }
//
// class AssetGenImage {
//   const AssetGenImage(this._assetName);
//
//   final String _assetName;
//
//   Image image({
//     Key? key,
//     AssetBundle? bundle,
//     ImageFrameBuilder? frameBuilder,
//     ImageErrorWidgetBuilder? errorBuilder,
//     String? semanticLabel,
//     bool excludeFromSemantics = false,
//     double? scale,
//     double? width,
//     double? height,
//     Color? color,
//     Animation<double>? opacity,
//     BlendMode? colorBlendMode,
//     BoxFit? fit,
//     AlignmentGeometry alignment = Alignment.center,
//     ImageRepeat repeat = ImageRepeat.noRepeat,
//     Rect? centerSlice,
//     bool matchTextDirection = false,
//     bool gaplessPlayback = false,
//     bool isAntiAlias = false,
//     String? package,
//     FilterQuality filterQuality = FilterQuality.low,
//     int? cacheWidth,
//     int? cacheHeight,
//   }) {
//     return Image.asset(
//       _assetName,
//       key: key,
//       bundle: bundle,
//       frameBuilder: frameBuilder,
//       errorBuilder: errorBuilder,
//       semanticLabel: semanticLabel,
//       excludeFromSemantics: excludeFromSemantics,
//       scale: scale,
//       width: width,
//       height: height,
//       color: color,
//       opacity: opacity,
//       colorBlendMode: colorBlendMode,
//       fit: fit,
//       alignment: alignment,
//       repeat: repeat,
//       centerSlice: centerSlice,
//       matchTextDirection: matchTextDirection,
//       gaplessPlayback: gaplessPlayback,
//       isAntiAlias: isAntiAlias,
//       package: package,
//       filterQuality: filterQuality,
//       cacheWidth: cacheWidth,
//       cacheHeight: cacheHeight,
//     );
//   }
//
//   ImageProvider provider({
//     AssetBundle? bundle,
//     String? package,
//   }) {
//     return AssetImage(
//       _assetName,
//       bundle: bundle,
//       package: package,
//     );
//   }
//
//   String get path => _assetName;
//
//   String get keyName => _assetName;
// }
