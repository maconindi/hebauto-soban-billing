import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../util/config.dart';
import '../util/constants.dart';

/// Circular App Button with Center Icon
class DxCircularButton extends StatefulWidget {
  final Function onTap;
  final IconData centerIcon;
  final Color? color;
  final bool isFaIcon;
  final Color? iconColor;
  final double? size;
  final double? elevation;
  final bool enabled;

  const DxCircularButton({
    required this.onTap,
    required this.centerIcon,
    this.color,
    this.isFaIcon = false,
    this.iconColor,
    this.size,
    this.elevation,
    this.enabled = true,
    super.key,
  });

  @override
  DxCircularButtonState createState() => DxCircularButtonState();
}

class DxCircularButtonState extends State<DxCircularButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enabled ) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: appButtonScaleAnimationDurationGlobal),
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

    return Listener(
      onPointerDown: (details) {
        _controller?.forward();
        widget.onTap.call();
      },
      onPointerUp: (details) {
        _controller?.reverse();
      },
      child: Transform.scale(
        scale: _scale,
        child: buildButton(),
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Material(
        shape: const CircleBorder(),
        elevation: widget.elevation ?? defaultAppButtonElevation,
        color: widget.color ?? appCircleButtonBackgroundColorGlobal,
        child: SizedBox(
          width: widget.size ?? 40.0,
          height: widget.size ?? 40.0,
          child: IconButton(
            onPressed: widget.enabled ? widget.onTap as void Function()? : null,
            icon: widget.isFaIcon ? FaIcon(widget.centerIcon, color: widget.iconColor ?? defaultIconColorGlobal,) : Icon(
              widget.centerIcon,
              color: widget.iconColor ?? defaultIconColorGlobal,
            ),
          ),
        ),
      ),
    );
  }
}
