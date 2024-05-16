import 'package:flutter/material.dart';
import 'package:hebauto/core/util/config.dart';

class SegmentedWidget extends StatelessWidget {
  const SegmentedWidget({super.key, 
    
    required this.onChanged,
    required this.index,
    required this.children,
  });
  final ValueChanged<int> onChanged;
  final int index;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    final shape = RoundedRectangleBorder(
      side: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8),
    );
    return ClipPath(
      clipper: ShapeBorderClipper(shape: shape),
      child: Container(
        foregroundDecoration: ShapeDecoration(
          shape: shape,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [..._buildChildren(context)],
          ),
        ),
      ),
    );
  }
  Iterable<Widget> _buildChildren(BuildContext context) sync* {
    final theme = Theme.of(context);
    final color = theme.cardColor;
    final textColor = theme.cardTheme.color;
    final style1 = theme.textTheme.bodyMedium;
    final style2 = theme.textTheme.bodyLarge;
    final data1 = theme.iconTheme.copyWith(color: color);
    final data2 = theme.iconTheme.copyWith(color: textColor);
    final duration = kThemeAnimationDuration;
    for (int i = 0; i < children.length; i++) {
      if (i > 0) {
        yield Container(
          color: color,
          width: 1,
        );
      }
      final selected = i == index;
      yield Expanded(
        child: GestureDetector(
          onTap: onChanged != null ? () => onChanged(i) : null,
          child: AnimatedContainer(
            duration: duration,
            color: selected ? color : color.withAlpha(0),
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            child: AnimatedTheme(
              data: theme.copyWith(
                iconTheme: selected ? data2 : data1,
              ),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                //style: selected ? style2 : style1,
                style: TextStyle(color: kPrimaryColor),
                child: children[i],
              ),
            ),
          ),
        ),
      );
    }
  }
}