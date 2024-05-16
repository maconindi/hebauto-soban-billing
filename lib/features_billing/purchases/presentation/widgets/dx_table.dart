import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/dx_button.dart';
import '../../../../core/util/constants.dart';
import '../../data/model/purchase_model.dart';
import '../../domain/entity/purchase_entity.dart';
import 'get_accounts.dart';
import 'get_vehicle_by_vin.dart';

class DxItemTable extends StatefulWidget {
  const DxItemTable(
      {super.key, required this.purchaseId, required this.callback});

  final Function(List<PurchaseItemEntity>) callback;
  final String purchaseId;

  @override
  _DxItemTableState createState() => _DxItemTableState();
}

class _DxItemTableState extends State<DxItemTable> {
  //InventoryItemEntity? inventory;

  final List<PurchaseItemModel> itemsMain = [];

  bool isDone = false;

  bool itemsMainValidationState = false;
  final ScrollController _controller = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController carDetailsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final String costCodeValue = '';
  final String carDetailsValue = '';
  final String descriptionValue = '';
  final String accountsValue = '';
  final String accountsCodeValue = '';
  final String qtyValue = '';
  final String unitPriceValue = '';
  final String amountValue = '';
  final String taxValue = '';
  final String totalCodeValue = '';
  int listenerKey = 0;

  //String finalPrice = '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // List<String> selectedValuesCostCode = ['Cost Code', 'Item 2', 'Item 3'];
  // List<String> selectedValuesAccounts = ['Accounts', 'Item 2', 'Item 3'];
  List<String> listCurrencies = ['USD', 'CAD', 'AED'];
  List<String> listTax = [
    'Sales Tax',
    'Purchase Tax',
  ];

  String getFinalPrice(String amount, String quantity, String currency) {
    double doubleAmount = double.tryParse(amount) ?? 0.0;
    int qty = int.tryParse(quantity) ?? 0;
    final totalAmountBeforeTax = qty * doubleAmount;
    final tax = totalAmountBeforeTax * 0.05;
    final totalAmount = (tax + totalAmountBeforeTax) *
        (currency == 'CAD'
            ? cadCurrencyRate
            : currency == 'USD'
                ? usdCurrencyRate
                : 1);
    return totalAmount.toString();
  }

  @override
  void initState() {
    super.initState();
    // itemsMain.add([
    //   costCodeValue,
    //   carDetailsValue,
    //   descriptionValue,
    //   accountsValue,
    //   qtyValue,
    //   amountValue,
    //   taxValue,
    //   totalCodeValue
    // ]);

    // Initialize the selected values list with null values for each item
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IgnorePointer(
          ignoring: isDone,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 228, 228, 228),
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            height: 200,
            child: _build(context),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            isDone
                ? const SizedBox.shrink()
                : DxButton(
                    width: 150,
                    elevation: 0,
                    height: 40,
                    color: const Color.fromARGB(255, 227, 227, 227),
                    onTap: () {
                      setState(() {
                        itemsMain.add(PurchaseItemModel(
                            costCode: costCodeValue,
                            details: carDetailsValue,
                            description: descriptionValue,
                            account: accountsValue,
                            quantity: qtyValue,
                            amount: amountValue,
                            tax: taxValue,
                            totalPrice: totalCodeValue,
                            unitPrice: unitPriceValue,
                            updatedAt: DateTime.now(),
                            createdAt: DateTime.now(),
                            purchaseIdFk: widget.purchaseId,
                            accountCode: accountsCodeValue));
                      });

                      const indexToScrollTo = 5;
                      const scrollOffset = indexToScrollTo * 80.0;
                      _controller.animateTo(
                        scrollOffset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Add line',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
            10.width,
            itemsMain.isNotEmpty
                ? DxButton(
                    width: 150,
                    elevation: 0,
                    height: 40,
                    color: const Color.fromARGB(255, 227, 227, 227),
                    onTap: () {
                      setState(() {
                        isDone = !isDone;
                        widget.callback(itemsMain);
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isDone ? 'Edit' : 'Done',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.check,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }

  _build(BuildContext context) {
    return itemsMain.isNotEmpty
        ? ListView.builder(
            controller: _controller,
            itemCount: itemsMain.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: buildSCROLL(context, index),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      itemsMain.removeAt(index);
                      itemsMainValidationState = false;
                    });
                  },
                ),
              );
            },
          )
        : const Center(child: Text('Add Items to purchase'));
  }

  Widget buildSCROLL(BuildContext context, int index) {
    //InventoryItemEntity? inventory;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: itemsMainValidationState
                  ? const Color.fromARGB(255, 250, 112, 102)
                  : Colors.white,
            ),
          ),
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GetVehicleByVinNumber(
                callback: (entity) {
                  setState(() {
                    //inventory = entity;

                    itemsMain[index].costCode = entity.vehicle?.vinNumber ?? '';

                    itemsMain[index].details =
                        entity.vehicle?.name ?? 'Details';
                  });
                },
              ),
              const VerticalDivider(),
              Container(
                width: 150,
                padding: const EdgeInsets.all(5),
                child: Text(
                  (itemsMain[index].details.isEmpty)
                      ? 'Details'
                      : (itemsMain[index].details).toString().validate(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const VerticalDivider(),
              Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        3), // Adjust border radius as needed
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      itemsMain[index].description = value.toString().trim();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none,
                    ),
                  )),
              const VerticalDivider(),
              Container(
                width: 120,
                padding: const EdgeInsets.all(5),
                child: GetAccounts(callback: (val) {

                  debugPrint('>> ${val.toJson(name: 'name')}');
                  itemsMain[index].account = val.accountName.toString().trim();
                  itemsMain[index].accountCode = val.code.toString().trim();
                }),
              ),
              const VerticalDivider(),
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        3), // Adjust border radius as needed
                  ),
                  child: TextField(
                    onChanged: (value) {
                      // setState(() {
                      itemsMain[index].quantity = value.toString().trim();
                      // });
                      //print(itemsMain);

                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          itemsMain[index].totalPrice = value.isNotEmpty
                              ? getFinalPrice(
                                  itemsMain[index].amount,
                                  itemsMain[index].quantity,
                                  itemsMain[index].unitPrice)
                              : '';
                        });
                      });
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Qty',
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none,
                    ),
                  )),
              const VerticalDivider(),
              Container(
                width: 120,
                padding: const EdgeInsets.all(5),
                child: _searchDropdown(context, 'Unit Price', listCurrencies,
                    (val) {
                  itemsMain[index].unitPrice = val.toString().trim();

                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      itemsMain[index].totalPrice = val.isNotEmpty
                          ? getFinalPrice(
                              itemsMain[index].amount,
                              itemsMain[index].quantity,
                              itemsMain[index].unitPrice)
                          : '';
                    });
                  });
                }),
              ),
              const VerticalDivider(),
              Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        3), // Adjust border radius as needed
                  ),
                  child: TextField(
                    onChanged: (value) {
                      itemsMain[index].amount = value.toString().trim();
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          itemsMain[index].totalPrice = value.isNotEmpty
                              ? getFinalPrice(
                                  itemsMain[index].amount,
                                  itemsMain[index].quantity,
                                  itemsMain[index].unitPrice)
                              : '';
                        });
                      });
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Amount',
                      hintStyle: TextStyle(fontSize: 12),
                      border: InputBorder.none,
                    ),
                  )),
              const VerticalDivider(),
              Container(
                alignment: Alignment.center,
                width: 130,
                padding: const EdgeInsets.all(5),
                child: _searchDropdown(context, 'Select Tax', listTax, (val) {
                  itemsMain[index].tax = val.toString().trim();
                }),
              ),
              const VerticalDivider(),
              Container(
                  width: 200,
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        3), // Adjust border radius as needed
                  ),
                  child: Text(
                    itemsMain[index].totalPrice.isEmptyOrNull
                        ? 'Total Price (AED)'
                        : itemsMain[index].totalPrice.toOneDecimal(),
                    style: const TextStyle(fontSize: 12),
                  )),
            ],
          )),
    );
  }

  _searchDropdown(BuildContext context, String hintText,
      List<String> itemsPassed, Function(String) callback) {
    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(fit: FlexFit.loose),
      items: itemsPassed,
      dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: const TextStyle(
            fontSize: 12,
          ),
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            //errorBorder: InputBorder.none,
          )),
      onChanged: (val) {
        callback.call(val ?? '');
      },
      // selectedItem: 'Brazil',
    );
  }
}
