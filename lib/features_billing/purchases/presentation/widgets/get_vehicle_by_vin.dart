import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/network/api/dio_client.dart';
import 'package:hebauto/injection.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/models/paginated_model.dart';
import '../../../../core/network/api/list_api.dart';
import '../../../../core/util/decorations.dart';
import '../../../../features_admin/inventory/data/model/inventory_model.dart';
import '../../../../features_admin/inventory/domain/entity/inventory_entity.dart';

class GetVehicleByVinNumber extends StatefulWidget {
  const GetVehicleByVinNumber({super.key, required this.callback});

  final Function(InventoryItemEntity) callback;

  @override
  State<GetVehicleByVinNumber> createState() => _GetVehicleByVinNumberState();
}

class _GetVehicleByVinNumberState extends State<GetVehicleByVinNumber> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      //height: 200,
      //padding: const EdgeInsets.all(5),
      child: DropdownSearch<InventoryItemEntity>(
        itemAsString: (val) => val.vehicle?.vinNumber.toString() ?? '',
        dropdownDecoratorProps: const DropDownDecoratorProps(
          baseStyle: TextStyle(fontSize: 12,),
            dropdownSearchDecoration: InputDecoration(
          hintText: 'Cost Code',
          hintStyle: TextStyle(fontSize: 12),


          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          //errorBorder: InputBorder.none,
        )),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DxText(text: data.vehicle?.vinNumber ?? ''),
                      DxText(text: data.vehicle?.lotNumber ?? ''),
                    ]),
              );
            }),
        asyncItems: (String filter) async {
          final response = await getIt<DioClient>()
              .getRequest(ListAPI.fetchInventory,
              queryParameters: {
            'vin_number': filter
          },
          //     data: {
          //   'cus_email': '${MainBoxMixin.mainBox?.get(MainBoxKeys.email.name)}'
          // },
              converter: (response) {
            final res =
                PaginatedModel.fromJson(response, entityName: 'item').data;

            final items = res.dataList
                .map((e) => InventoryItemModel.fromJson(e))
                .toList();
            return items;
          });
          return response.fold((l) => [], (r) => r);

        },
        onChanged: (InventoryItemEntity? data) {
          widget.callback(data ?? const InventoryItemEntity());
        },
      ),
    );
  }
}
