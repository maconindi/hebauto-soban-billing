

import 'package:flutter/material.dart';

import '../util/ext/bool.dart';
import '../util/ext/context.dart';
import '../util/ext/device.dart';
import '../util/ext/widget.dart';

class Responsive extends StatelessWidget {
  final Widget? web;
  final Widget mobile;
  final Widget? tablet;
  final bool? useFullWidth;
  final double? width;
  final double? minHeight;
  final Widget? defaultWidget;

  const Responsive({
    this.web,
    required this.mobile,
    this.tablet,
    this.useFullWidth,
    this.width,
    this.minHeight,
    this.defaultWidget,
    super.key,
  });


  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >=  600.0 &&
          MediaQuery.of(context).size.width <= 720.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >  720.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.device == DeviceSize.tablet) {
          return tablet ?? mobile;
        } else if (constraints.device == DeviceSize.mobile) {
          return mobile;
        } else if (constraints.device == DeviceSize.desktop) {
          /// $desktopBreakpointGlobal checkout this variable to breakout desktop widget

          if (minHeight != null && constraints.minHeight < minHeight!) {
            return defaultWidget.validate();
          } else {
            return Container(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: useFullWidth.validate(value: true)
                    ? null
                    : BoxConstraints(
                    maxWidth: width ?? (context.width() * 0.9)),
                child: web ?? const SizedBox.shrink(),
              ),
            );
          }
        }
        return web ?? tablet ?? mobile;
      },
    );
  }
}