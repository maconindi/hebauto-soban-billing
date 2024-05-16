import 'package:flutter/material.dart';

import 'colors.dart';
import 'decorations.dart';

Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
Color textTertiaryColorGlobal = textTertiaryColorGlobal;
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
double textTertiarySizeGlobal = 10;
String? fontFamilyBoldGlobal;
String? fontFamilyPrimaryGlobal;
String? fontFamilySecondaryGlobal;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;
FontWeight fontWeightTertiaryGlobal = FontWeight.normal;
Color kPrimaryColor = const Color(0xFFF14E62);
Color appBarBackgroundColorGlobal = const Color(0XFFF1F0F0);
Color appButtonBackgroundColorGlobal = Colors.red;
Color appBorderButtonBackgroundColorGlobal = const Color(0xFFFFCDD2);
Color appCircleButtonBackgroundColorGlobal = Colors.white;
Color defaultAppButtonTextColorGlobal = textPrimaryColorGlobal;
Color defaultBorderButtonTextColorGlobal = blackColor;
Color defaultIconColorGlobal = Colors.red;
double defaultAppButtonRadius = 10.0;
double defaultTextFieldRadius = 10.0;
double defaultDropdownRadius = 10.0;
double defaultAppButtonElevation = 4.0;
bool enableAppButtonScaleAnimationGlobal = true;

ShapeBorder? defaultAppButtonShapeBorder;
ShapeBorder? defaultBorderButtonShapeBorder;

Color defaultLoaderBgColorGlobal = Colors.white;
Color? defaultLoaderAccentColorGlobal;

Color? defaultInkWellSplashColor;
Color? defaultInkWellHoverColor;
Color? defaultInkWellHighlightColor;
double? defaultInkWellRadius;

Color shadowColorGlobal = Colors.grey.withOpacity(0.2);
int defaultElevation = 4;
double defaultItemsRadius = 10.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;

double? maxScreenWidth;

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

int passwordLengthGlobal = 6;

ShapeBorder? defaultDialogShape;

/// If forceEnableDebug if true, you will be able to see log in the logcat in release build also.
/// By default, your log will not seen in logcat in release mode.
bool forceEnableDebug = false;

// Toast Config
Color defaultToastBackgroundColor = Colors.grey.shade200;
Color defaultToastTextColor = Colors.black;

Future<void> initialize({
  double? defaultDialogBorderRadius,
  String? defaultLanguage,
}) async {
  defaultAppButtonShapeBorder = RoundedRectangleBorder(
    borderRadius: radius(defaultAppButtonRadius),
  );
  defaultBorderButtonShapeBorder = RoundedRectangleBorder(
    borderRadius: radius(defaultAppButtonRadius),
    side:  BorderSide(
      color: kPrimaryColor,
    ),
  );

  defaultDialogShape = dialogShape(defaultDialogBorderRadius);
}
