import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/common.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/cutomer_profile_bloc.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/constants.dart';
import '../../../dashboard/presentation/widgets/page_controller_provider.dart';
import '../../domain/entity/customer_entity.dart';
import '../bloc/customer_profile_event.dart';

class DxCustomerTable extends StatefulWidget {
  const DxCustomerTable({super.key, required this.customers});

  final List<CustomerEntity> customers;

  @override
  State<DxCustomerTable> createState() => _DxCustomerTableState();
}

class _DxCustomerTableState extends State<DxCustomerTable> {
  final yourScrollController = ScrollController();

  static const fontSize = 13.0;
  static const lineThickness = 0.5;
  static const doubleColumnWidth = 130.0;

  bool isDeleteActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: Scrollbar(
        thumbVisibility: true,
        //always show scrollbar
        thickness: 10,
        //width of scrollbar
        controller: yourScrollController,
        radius: Radius.circular(defaultItemsRadius),
        child: Column(
          children: [
            SingleChildScrollView(
              controller: yourScrollController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                child: DataTable(
                  headingRowHeight: 70,
                  //horizontalMargin: 5,
                  columnSpacing: 20,
                  // checkboxHorizontalMargin: 0,
                  border: TableBorder.all(
                      color: grey,
                      borderRadius: BorderRadius.circular(defaultItemsRadius)),
                  showBottomBorder: true,
                  columns: [
                    DataColumn(
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText('ID',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ).expand(),
                    ),
                    DataColumn(
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText(
                            'Email',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: doubleColumnWidth,
                            height: lineThickness,
                            color: grey,
                          ),
                          const SelectableText(
                            'Phone',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ).expand(),
                    ),
                    DataColumn(
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText('Customer Name',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            width: doubleColumnWidth,
                            height: lineThickness,
                            color: grey,
                          ),
                          const SelectableText('Company',
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ).expand(),
                    ),
                    DataColumn(
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText(
                            'Country',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: doubleColumnWidth,
                            height: lineThickness,
                            color: grey,
                          ),
                          const SelectableText(
                            'Address',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ).expand(),
                    ),
                    DataColumn(
                      label: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SelectableText(
                            'Active',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: doubleColumnWidth,
                            height: lineThickness,
                            color: grey,
                          ),
                          const SelectableText(
                            'Created Date',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ).expand(),
                    ),
                    const DataColumn(label: SizedBox.shrink()),
                    const DataColumn(label: SizedBox.shrink()),
                  ],
                  rows: widget.customers.asMap().entries.map(
                    (item) {
                      final e = item.value;

                      //debugPrint('>>> ${item.value.companyName} ${item.value.name}');

                      return DataRow(
                        color: item.key % 2 == 0
                            ? MaterialStateProperty.all(lightGrey)
                            : MaterialStateProperty.all(white),
                        onLongPress: () {
                          // PageControllerProvider.of(context)
                          //     ?.pageController
                          //     .jumpToPage(11);
                          // PageControllerProvider.of(context)?.entity = e;
                        },
                        cells: [
                          DataCell(
                            Center(
                              child: SelectableText('${item.key + 1}'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SelectableText(
                                    e.email.isEmptyOrNull ? 'N/A' : e.email,
                                  ),
                                  2.height,
                                  SelectableText(
                                    e.phone.isEmptyOrNull ? 'N/A' : e.phone,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SelectableText(
                                    e.name.isEmptyOrNull ? 'N/A' : e.name,
                                  ),
                                  2.height,
                                  SelectableText(
                                    e.companyName.isEmptyOrNull
                                        ? 'N/A'
                                        : e.companyName,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SelectableText(
                                    e.country.isEmptyOrNull ? 'N/A' : e.country,
                                  ),
                                  2.height,
                                  SelectableText(
                                    e.address.isEmptyOrNull ? 'N/A' : e.address,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: greenColor,
                                  ),
                                  2.height,
                                  SelectableText(formatDateTime(
                                      e.createdAt ?? DateTime(0))),
                                ],
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  PageControllerProvider.of(context)
                                      ?.pageController
                                      .jumpToPage(12);

                                  PageControllerProvider.of(context)?.user = e;
                                },
                                icon: const Icon(
                                  Icons.edit_note_outlined,
                                  color: greenColor,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  if(isDeleteActive){
                                    context
                                        .read<CustomerProfileBloc>()
                                        .add(DeleteCustomerEvent(e.cusId));
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: redColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
          ],
        ),
      ),
    );
  }
}
