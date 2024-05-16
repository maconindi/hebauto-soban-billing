import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/fd_textfield.dart';
import '../../../../core/models/models_util.dart';
import '../../../../core/util/decorations.dart';

Future<Map<String, dynamic>> showAddGroupAlert (BuildContext  context, {required String title}) async {

  final text = TextEditingController();

  String? groupName =  await showDialog(
  context: context,
  builder:
      (BuildContext context) {
    String result = '';

    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width:
        context.width() /
            3,
        child: Column(
          mainAxisSize:
          MainAxisSize
              .min,
          children: [
            10.height,
            FDTextField(
              controller:
              text,
              textFieldType:
              TextFieldType
                  .NAME,
              decoration:
              defaultInputDecoration(
                  label:
                  'Name'),
              // validator: validateTextField,
            ),
            20.height,
            DropdownSearch<
                String>(
              items: const [
                'Assets',
                'Liabilities',
                'Equity',
                'Cost Of Sales',
                'Income',
                'Expenses'
              ],
              key:
              UniqueKey(),
              dropdownDecoratorProps:
              DropDownDecoratorProps(
                dropdownSearchDecoration:
                defaultInputDecoration(
                  label:
                  'Select Group',
                ),
              ),
              onChanged:
                  (data) {
                result =
                    data ??
                        '';
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Add your logic to handle the data
            Navigator.of(
                context)
                .pop(result);
          },
          child: const Text(
              'Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(
                context)
                .pop();
          },
          child: const Text(
              'Cancel'),
        ),
      ],
    );
  },
  );

  return {'groupValue' : groupName ?? '', 'name': text.text.toString()};


}


Future<Map<String, dynamic>> showAddAccountAlert (BuildContext context , List<dynamic> groups, {required String title}) async {

  final name = TextEditingController();
  final code = TextEditingController();

  int? groupId = await showDialog(
    context: context,
    builder:
        (BuildContext context) {
      int groupId = 0;

      return AlertDialog(
        title:  Text(
            title),
        content: SizedBox(
          width:
          context.width() /
              3,
          child: Column(
            mainAxisSize:
            MainAxisSize
                .min,
            children: [
              10.height,
              Row(
                children: [
                  FDTextField(
                    controller:
                    name,
                    textFieldType:
                    TextFieldType
                        .NAME,
                    decoration:
                    defaultInputDecoration(
                        label:
                        'Name'),
                    // validator: validateTextField,
                  ).expand(
                      flex: 2),
                  10.width,
                  FDTextField(
                    controller:
                    code,
                    textFieldType:
                    TextFieldType
                        .NAME,
                    decoration:
                    defaultInputDecoration(
                        label:
                        'Code'),
                    // validator: validateTextField,
                  ).expand(),
                ],
              ),
              20.height,
              DropdownSearch<
                  dynamic>(
                items: groups,
                itemAsString: (val) => val is Accounts ? val.accountName: val.groupName,
                key:
                UniqueKey(),
                dropdownDecoratorProps:
                DropDownDecoratorProps(
                  dropdownSearchDecoration:
                  defaultInputDecoration(
                    label: title,
                  ),
                ),
                onChanged:
                    (data) {
                  groupId = data?.id ?? 0;

                  //debugPrint('>> ${groupId}');
                  // group = data ?? '';
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add your logic to handle the data


              Navigator.of(
                  context)
                  .pop(groupId);
            },
            child: const Text(
                'Add'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                  context)
                  .pop();
            },
            child: const Text(
                'Cancel'),
          ),
        ],
      );
    },
  );

  return {'groupValue' : groupId ?? 0, 'name': name.text.toString(), 'code':code.text.toString()};
}