
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/decorations.dart';

import '../../../../features_admin/customer_profile/domain/entity/customer_entity.dart';



class SearchCustomerDropDown extends StatefulWidget {
  const SearchCustomerDropDown({super.key, required this.customers , required this.customerCallback});

  final List<CustomerEntity> customers;
  final Function(CustomerEntity) customerCallback;

  @override
  State<SearchCustomerDropDown> createState() => _SearchCustomerDropDownState();
}

class _SearchCustomerDropDownState extends State<SearchCustomerDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<CustomerEntity>(
      items: widget.customers,
      key: UniqueKey(),
      itemAsString: (CustomerEntity u) => u.email.toString(),
      popupProps: PopupProps.menu(
          showSearchBox: true,
          itemBuilder: (ctx, data, status) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DxText(text: data.name),
                    DxText(text: data.email),
                  ]),
            );
          }),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: defaultInputDecoration(
          label: 'Select Customer',
        ),
      ),
      onChanged: (data) {
        widget.customerCallback(data  ?? CustomerEntity());

      },
    );
  }
}
