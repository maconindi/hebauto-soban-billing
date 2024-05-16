import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_textfield.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/ext.dart';

const List<String> inventoryDropdownItems = <String>[
  'Vin Number',
  'Lot Number',
  'Name & Model',
  'Booking No',
  'Container No',
];

const List<String> mapDropdownItems = <String>['CANADA', 'UAE', 'USA'];

enum DropDownType { INVENTORY_SEARCH, LOCATION_FILTER }

class DropDownSearchWidget extends StatefulWidget {
  DropDownSearchWidget(
      {Key? key,
      required this.callback,
      this.disableSearch = false,
      this.filled = true,
      this.dropDownType = DropDownType.INVENTORY_SEARCH})
      : super(key: key);

  final DropDownType dropDownType;
  bool disableSearch = false;
  bool filled = true;
  final Function(String, String) callback;

  @override
  State<DropDownSearchWidget> createState() => _DropDownSearchWidgetState();
}

class _DropDownSearchWidgetState extends State<DropDownSearchWidget> {
  @override
  void initState() {
    super.initState();

    searchType = widget.dropDownType == DropDownType.INVENTORY_SEARCH
        ? inventoryDropdownItems.first
        : mapDropdownItems.first;

    listItems = widget.dropDownType == DropDownType.INVENTORY_SEARCH
        ? inventoryDropdownItems
        : mapDropdownItems;
  }

  Timer? _debounce;
  String searchType = '';

  List<String> listItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding:widget.filled == false ? const EdgeInsets.only(left: 5) : EdgeInsets.zero,
      decoration: boxDecorationWithRoundedCorners(
        border: Border.all(
          color: grey.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          DropdownMenu<String>(
            width: context.isPhone() ? 120 : null,
            inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              fillColor: grey.withOpacity(0.5),
              filled: widget.filled,
              // suffixIconColor: Colors.transparent
            ),
            initialSelection: listItems.first,
            onSelected: (String? value) {
              setState(() {
                searchType = value ?? '';
              });

              if(widget.disableSearch){
                widget.callback.call(searchType, '');
              }
            },
            dropdownMenuEntries:
                listItems.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ).expand(),


          widget.disableSearch
              ? const SizedBox.shrink()
              : DxTextField(

                  textFieldType: TextFieldType.NAME,
                  onChanged: _onSearchChanged,
                  decoration: fdInputDecoration(
                    hint: 'Search by $searchType',
                    textStyle: TextStyle(
                      color: grey.withOpacity(0.5),
                    ),
                  ),
                ).expand(flex: context.isPhone() ? 2 : 1 )
        ],
      ),
    );
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      widget.callback.call(searchType, query);
    });
  }
}
