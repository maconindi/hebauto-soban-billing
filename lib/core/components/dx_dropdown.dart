import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/config.dart';
import '../util/constants.dart';
import '../util/decorations.dart';
import '../util/ext/context.dart';
import '../util/text_styles.dart';

enum DropDownType {
  ROUNDED_BOX,
  UNDERLINED_BOX,
}

class DxDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String) onTap;
  final String hint;
  final String title;
  final double width;
  final double height;
  final bool isStar;

  final DropDownType type;

  const DxDropdown(
      {super.key,
      required this.hint,
      required this.onTap,
      this.title = '',
      this.isStar = false,
      required this.items,
      this.width = 150,
      this.height = defaultItemHeight,
      this.type = DropDownType.ROUNDED_BOX});

  @override
  State<DxDropdown> createState() => _DxDropdownState();
}

class _DxDropdownState extends State<DxDropdown> {
  String? selectedValue;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: Column(
        children: [
          widget.title.toString().isNotEmpty ? Row(
            children: [
              Text(
                widget.title ?? '',
                style: primaryTextStyle(),
              ),
              widget.isStar
                  ? Text(
                      ' *',
                      style: secondaryTextStyle(size: 20, color: redColor),
                    )
                  : Container()
            ],
          ): const SizedBox.shrink(),
          Container(
            width: context.width(),
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            height: widget.height,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                style: primaryTextStyle(),
                hint: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.hint,
                        style: primaryTextStyle(color: grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map(
                      (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: primaryTextStyle(color: black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  widget.onTap(value ?? '');
                },
                buttonStyleData: ButtonStyleData(
                  height: 45,
                  width: widget.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: widget.type == DropDownType.ROUNDED_BOX
                      ? boxDecorationWithRoundedCorners()
                      : const BoxDecoration(
                          border: Border(bottom: BorderSide(color: grey))),
                  //elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                  ),
                  iconSize: 14,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: widget.width,
                  decoration: boxDecorationWithRoundedCorners(),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: Radius.circular(defaultItemsRadius),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
