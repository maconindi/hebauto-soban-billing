import 'package:flutter/material.dart';


import '../util/common.dart';
import '../util/config.dart';
import '../util/constants.dart';
import '../util/text_styles.dart';

import '../util/ext/bool.dart';
import '../util/ext/string.dart';


/// Default App Button
class DxButton extends StatefulWidget {

  const DxButton({
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.textColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.shapeBorder,
    this.child,
    this.elevation,
    this.enabled = true,
    this.height = defaultItemHeight,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
    this.disabledTextColor,
    super.key,
  });
  final Function? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final Widget? child;
  final double? elevation;
  final double? height;
  final bool enabled;
  final bool? enableScaleAnimation;
  final Color? disabledTextColor;

  @override
  DxButtonState createState() => DxButtonState();
}

class DxButtonState extends State<DxButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && widget.enabled) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 2.0),
      height: widget.height,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: MaterialButton(
          minWidth: widget.width,
          padding: widget.padding ?? dynamicAppButtonPadding(context),
          onPressed: widget.enabled
              ? widget.onTap != null
              ? widget.onTap as void Function()?
              : null
              : null,
          color: widget.color ?? appButtonBackgroundColorGlobal,
          shape: widget.shapeBorder ?? defaultAppButtonShapeBorder,
          elevation: widget.elevation ?? defaultAppButtonElevation,
          animationDuration: const Duration(milliseconds: 300),
          height: widget.height,

          disabledColor: widget.disabledColor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          splashColor: widget.splashColor,
          disabledTextColor: widget.disabledTextColor,
          child: widget.child ??
              Text(
                widget.text.toString().validate(),
                style: widget.textStyle ??
                    primaryTextStyle(
                      color: widget.textColor ?? textSecondaryColorGlobal,
                    ),
              ),
        ),
      ),
    );
  }
}
