import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/config.dart';
import '../util/constants.dart';
import '../util/decorations.dart';
import '../util/text_styles.dart';

enum DropDownType {
  ROUNDED_BOX,
  UNDERLINED_BOX,
}

class DxDropdownBordered extends StatefulWidget {
  final List<String> items;
  final Function(String) onTap;
  final String hint;
  final String title;
  final double width;
  final double height;
  final bool isStar;

  final DropDownType type;

  const DxDropdownBordered(
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
  State<DxDropdownBordered> createState() => _DxDropdownState();
}

class _DxDropdownState extends State<DxDropdownBordered> {
  String? selectedValue;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    items = widget.items.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          widget.title.toString().isNotEmpty
              ? Row(
                  children: [
                    Text(
                      widget.title ?? '',
                      style: primaryTextStyle(),
                    ),
                    widget.isStar
                        ? Text(
                            ' *',
                            style:
                                secondaryTextStyle(size: 20, color: redColor),
                          )
                        : Container()
                  ],
                )
              : const SizedBox.shrink(),
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(
                      255, 143, 143, 143), // Set the border color
                  width: 0.60,
                  // Set the border width
                ),
                borderRadius: BorderRadius.circular(10)),
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
                iconStyleData: IconStyleData(
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/icons/arrowDown.png',
                      width: 15,
                      height: 15,
                    ),
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
