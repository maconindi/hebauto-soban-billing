import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/models/models_util.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../../../core/util/decorations.dart';
import '../../../../injection.dart';

class GetAccounts extends StatefulWidget {
  const GetAccounts({super.key, required this.callback});

  final Function(Accounts) callback;

  @override
  State<GetAccounts> createState() => _GetAccountsState();
}

class _GetAccountsState extends State<GetAccounts> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      //height: 200,
      //padding: const EdgeInsets.all(5),
      child: DropdownSearch<Accounts>(
        itemAsString: (val) => val.accountName.toString(),
        dropdownDecoratorProps: const DropDownDecoratorProps(
          baseStyle: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
          dropdownSearchDecoration: InputDecoration(
            hintText: 'Account',
            hintStyle: TextStyle(fontSize: 12),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            isFilterOnline: true,
            //searchFieldProps: TextFieldProps(),
            fit: FlexFit.loose,
            itemBuilder: (ctx, data, status) {
              return Container(
                decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: Colors.red)),
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Column(
                  children: [
                    DxText(text: data.accountName.toString()),
                  ],
                ),
              );
            }),
        asyncItems: (String filter) async {
          final response = await getIt<DioClient>().getRequest(
              ListAPI.fetchAccountOfCharts,
              queryParameters: {'level': 3, 'name': filter},
              converter: (response) {
            final res = ResponseModelList.fromJson(response, entityName: 'data');
            final items = res.item.map((e) => Accounts.fromJson(e, name: 'name')).toList();
            return items;
          });
          return response.fold((l) => [], (r) => r);
        },
        onChanged: (Accounts? data) {
          widget.callback(data ?? Accounts.empty());
        },
      ),
    );
  }
}
