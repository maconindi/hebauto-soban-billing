import 'package:flutter/material.dart';

import 'colors.dart';
import 'config.dart';
import 'constants.dart';
import 'text_styles.dart';

OutlineInputBorder defaultOutlinedInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultTextFieldRadius),
  borderSide: const BorderSide(
    color: Colors.white,
  ),
);

/// returns default InputDecoration for AppTextField widget
InputDecoration defaultInputDecoration(
    {String? hint, String? label, TextStyle? textStyle}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,

    helperText: '',
    hintStyle: textStyle ?? primaryTextStyle(),
    labelStyle: textStyle ?? textInputTextStyle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultItemsRadius)
    ),
    //alignLabelWithHint: true,
  );
}

InputDecoration fdInputDecoration(
    {String? hint, String? label, TextStyle? textStyle, bool? fill}) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    // filled: fill ?? false,
    // //fillColor: whiteColor,
    contentPadding: defaultContentPadding(),
    hintStyle: textStyle ?? primaryTextStyle(color: blackColor),
    labelStyle: textStyle ?? secondaryTextStyle(color: blackColor),
    focusedErrorBorder: defaultOutlinedInputBorder,
    focusedBorder: defaultOutlinedInputBorder,
    disabledBorder: defaultOutlinedInputBorder,
    border: defaultOutlinedInputBorder,
    enabledBorder: defaultOutlinedInputBorder,
    alignLabelWithHint: true,
  );
}

/// returns Radius
BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? defaultItemsRadius));
}

// EdgeInsets spacing ([double spacing]){
//   return const EdgeInsets.symmetric(horizontal: spacing, vertical: spacing);
// }

/// returns Radius
Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ?? defaultItemsRadius);
}

ShapeBorder dialogShape([double? borderRadius]) {
  return RoundedRectangleBorder(
    borderRadius: radius(borderRadius ?? defaultItemsRadius),
  );
}

EdgeInsets defaultContentPadding([double? spacing]){
  return const EdgeInsets.symmetric(horizontal: defaultHorizontalSpacing, vertical: defaultVerticalSpacing);
}

/// returns custom Radius on each side
BorderRadius radiusOnly({
  double? topRight,
  double? topLeft,
  double? bottomRight,
  double? bottomLeft,
}) {
  return BorderRadius.only(
    topRight: radiusCircular(topRight ?? 0),
    topLeft: radiusCircular(topLeft ?? 0),
    bottomRight: radiusCircular(bottomRight ?? 0),
    bottomLeft: radiusCircular(bottomLeft ?? 0),
  );
}

BoxDecoration boxDecorationDefault({
  BorderRadiusGeometry? borderRadius,
  Color? color,
  Gradient? gradient,
  BoxBorder? border,
  BoxShape? shape,
  BlendMode? backgroundBlendMode,
  List<BoxShadow>? boxShadow,
  DecorationImage? image,
}) {
  return BoxDecoration(
    borderRadius: (shape != null && shape == BoxShape.circle)
        ? null
        : (borderRadius ?? radius()),
    boxShadow: boxShadow ?? defaultBoxShadow(),
    color: color ?? Colors.white,
    gradient: gradient,
    border: border,
    shape: shape ?? BoxShape.rectangle,
    backgroundBlendMode: backgroundBlendMode,
    image: image,
  );
}

/// rounded box decoration
BoxDecoration boxDecorationWithRoundedCorners({
  Color backgroundColor = whiteColor,
  BorderRadius? borderRadius,
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
}) {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius:
        boxShape == BoxShape.circle ? null : (borderRadius ?? radius()),
    gradient: gradient,
    border: border,
    boxShadow: boxShadow,
    image: decorationImage,
    shape: boxShape,
  );
}

/// box decoration with shadow
Decoration boxDecorationWithShadow({
  Color backgroundColor = whiteColor,
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
  LinearGradient? gradient,
  BoxBorder? border,
  List<BoxShadow>? boxShadow,
  DecorationImage? decorationImage,
  BoxShape boxShape = BoxShape.rectangle,
  BorderRadius? borderRadius,
}) {
  return BoxDecoration(
    boxShadow: boxShadow ??
        defaultBoxShadow(
          shadowColor: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
    color: backgroundColor,
    gradient: gradient,
    border: border,
    image: decorationImage,
    shape: boxShape,
    borderRadius: borderRadius,
  );
}

/// rounded box decoration with shadow
Decoration boxDecorationRoundedWithShadow(
  int radiusAll, {
  Color backgroundColor = whiteColor,
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
  LinearGradient? gradient,
}) {
  return BoxDecoration(
    boxShadow: defaultBoxShadow(
      shadowColor: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    ),
    color: backgroundColor,
    gradient: gradient,
    borderRadius: radius(radiusAll.toDouble()),
  );
}

/// default box shadow
List<BoxShadow> defaultBoxShadow({
  Color? shadowColor,
  double? blurRadius,
  double? spreadRadius,
  Offset offset = const Offset(0.0, 0.0),
}) {
  return [
    BoxShadow(
      color: shadowColor ?? shadowColorGlobal,
      blurRadius: blurRadius ?? defaultBlurRadius,
      spreadRadius: spreadRadius ?? defaultSpreadRadius,
      offset: offset,
    )
  ];
}
