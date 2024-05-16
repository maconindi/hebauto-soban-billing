import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../util/config.dart';
import '../util/text_styles.dart';

/// Default AppBar
AppBar appBarWidget(
    String title, {
      @Deprecated('Use titleWidget instead') Widget? child,
      Widget? titleWidget,
      List<Widget>? actions,
      Color? color,
      bool center = false,
      Color? textColor,
      int textSize = 20,
      bool showBack = true,
      Color? shadowColor,
      double? elevation,
      Widget? backWidget,
      @Deprecated('Use systemOverlayStyle instead') Brightness? brightness,
      SystemUiOverlayStyle? systemUiOverlayStyle,
      TextStyle? titleTextStyle,
      PreferredSizeWidget? bottom,
      Widget? flexibleSpace,
    }) {
  return AppBar(
    centerTitle: center,
    title: titleWidget ??
        Text(
          title,
          style: titleTextStyle ??
              (boldTextStyle(
                  color: textColor ?? textPrimaryColorGlobal, size: textSize)),
        ),
    actions: actions,
    automaticallyImplyLeading: showBack,
    backgroundColor: color ?? appBarBackgroundColorGlobal,
    leading: showBack
        ? (backWidget ?? BackButton(color: textColor ?? textPrimaryColorGlobal))
        : null,
    shadowColor: shadowColor,
    elevation: elevation ?? defaultAppBarElevation,
    systemOverlayStyle: systemUiOverlayStyle,
    bottom: bottom,
    flexibleSpace: flexibleSpace,
  );
}