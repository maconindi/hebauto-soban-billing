import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hebauto/core/util/colors.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/components/dx_button.dart';
import '../../../../core/components/dx_date_picker.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/decorations.dart';
import '../../data/model/purchase_model.dart';
import '../../domain/usecase/purchases_usecase.dart';

import '../widgets/dx_table.dart';
import '../widgets/utils_created.dart';

class AddPurchaseScreen extends StatefulWidget {
  const AddPurchaseScreen({super.key});

  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
  bool itemsMainValidationStateSecond = false;

  // values to pass ----------------------------------
  final addressController = TextEditingController();
  final dueDateController = TextEditingController();
  final issuedDateController = TextEditingController();

  final invoiceNumberController = TextEditingController();
  final invoiceDateController = TextEditingController();

  final supplierNameController = TextEditingController();
  final billingAddressController = TextEditingController();

  List<PurchaseItemModel> purchaseItemsList = [];

  String invoiceNumber = 'Generate';

  String selectedSaleCategory = '';
  String customerSelectedIdValue = '';
  final String dueDateValue = '';
  final String issuedDateValue = '';
  bool wrongSalesCat = false;
  bool wrongCosCat = false;

  //-------------------------------------------------
  bool due = false;
  bool issued = false;

  DateTime? dueDate;

  //CustomerEntity? customer;
  DateTime? issuedDate;
  FilePickerResult? result;
  bool? selectionIcon = false;
  bool? selectionIconSecond = false;
  bool fileReady = false;
  String fileName = '';
  String fileType = '';
  late PlatformFile file;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to fetch data every time the route changes
    if (ModalRoute.of(context)?.isCurrent == true) {
      //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: FDTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: issuedDateController,
                    decoration: defaultInputDecoration(label: 'Issue Date'),
                    readOnly: true,
                    suffix: const Icon(Icons.calendar_month_outlined),
                    onTap: () {
                      showDxDatePicker(context,
                          onDateSelected: (date, strDate) {
                        setState(() {
                          issuedDate = date;
                          issuedDateController.text = formatDateTime(date);
                        });
                      });
                    },
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),

                SizedBox(
                  width: 200,
                  child: FDTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: dueDateController,
                    decoration: defaultInputDecoration(label: 'Due Date'),
                    readOnly: true,
                    suffix: const Icon(Icons.calendar_month_outlined),
                    onTap: () {
                      showDxDatePicker(context,
                          onDateSelected: (date, strDate) {
                        setState(() {
                          dueDate = date;
                          dueDateController.text = formatDateTime(date);
                        });
                      });
                    },
                  ),
                ),
                // _buildDateField(
                //   checker: issued,
                //   controller: issuedDateController,
                //   labelText: 'Issued Date',
                //   onChanged: (date) {
                //     setState(() {
                //       issuedDate = date;
                //     });
                //   },
                // ).expand(),
                // const SizedBox(width: 20),
                // _buildDateField(
                //   checker: due,
                //   controller: dueDateController,
                //   labelText: 'Due Date',
                //   onChanged: (date) {
                //     setState(() {
                //       dueDate = date;
                //     });
                //   },
                // ).expand(),
                const SizedBox(width: 20),
                _buildInvoiceNumber(),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: FDTextField(
                controller: supplierNameController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Supplier Name'),
                //validator,
              ),
            ),
            const SizedBox(height: 20),
            _buildAddressField(),
            const SizedBox(
              height: 50,
            ),
            MouseRegion(
                onEnter: (_) =>
                    setState(() => itemsMainValidationStateSecond = false),
                // onExit: (_) => setState(() => _isHovered = false),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: itemsMainValidationStateSecond
                          ? Colors.red
                          : Colors.white,
                    ),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: DxItemTable(
                    purchaseId: invoiceNumber,
                    callback: (list) {
                      purchaseItemsList = list as List<PurchaseItemModel>;

                    },
                  ),
                )),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () async {
                  result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: [
                      'pdf',
                      'doc',
                      'jpeg',
                      'png',
                      'jpg',
                    ],
                  );

                  if (result != null) {
                    file = result!.files.first;
                    if (file.extension == 'pdf' ||
                        file.extension == 'doc' ||
                        file.extension == 'jpeg' ||
                        file.extension == 'png' ||
                        file.extension == 'jpg') {
                      setState(() {
                        selectionIconSecond = false;
                        fileName = file.name;
                        selectionIcon = true;
                        fileReady = true;
                        fileType = file.extension!;
                      });
                    } else {
                      setState(() {
                        fileName =
                            ' Wrong file type try:(.pdf, .doc, .jpeg, .png or .jpg)';
                        selectionIconSecond = true;
                        fileReady = false;
                      });
                    }
                  } else {
                    setState(() {
                      selectionIcon = false;
                      fileReady = false;
                      selectionIconSecond = false;
                    });
                  }

                  //print(fileType); // Handle the tap event
                  // You can navigate to a new screen, show a dialog, etc.
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 228, 228),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selectionIconSecond == false
                          ? Colors.grey
                          : Colors.red,
                    ),
                  ),
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.upload_file,
                        color: selectionIcon == false
                            ? const Color.fromARGB(255, 103, 103, 103)
                            : Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        result != null ? fileName : 'Choose File',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: selectionIcon == false
                              ? const Color.fromARGB(255, 103, 103, 103)
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 228, 228),
                borderRadius: BorderRadius.circular(2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0375D2)
                        .withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // How spread out the shadow is
                    // How blurry the shadow is
                    offset: const Offset(0, 2), // Position of the shadow
                  ),
                ],
              ),
              width: double.infinity,
              height: 110,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Label text',
                    style: TextStyle(color: Color(0xFF0375D2)),
                  ),
                  SizedBox(
                      width: 220,
                      child: Text(
                        style: TextStyle(fontSize: 12),
                        'This is a long input in a multi-line textfield that wraps overflow text unto a new line',
                        maxLines: 3,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 2,
                color: Color(0xFF0375D2), // Set color to #0375D2
              ),
            ),
            DxButton(
              width: 150,
              height: 40,
              color: const Color(0xFF30C0CD),
              onTap: () async {

                final purchaseItem = AddPurchasesParams(
                  itemId: invoiceNumber,
                  issueDate: issuedDate,
                  dueDate: dueDate,
                  supplierName: supplierNameController.text,
                  billingAddress: billingAddressController.text,
                  items: purchaseItemsList
                );


                 final bytes = await setPageDetails(purchaseItem);


                AnchorElement(
                    href: 'data:application/pdf;base64,${base64Encode(bytes)}')
                  ..setAttribute('download', 'temp.pdf')
                  ..click();
                //
                // showDialog(
                //   context: context,
                //
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //         content:  SizedBox(
                //             width: context.width(),
                //             height: context.height(),
                //             child: SfPdfViewer.memory(bytes)));
                //   },
                // );


                 //context.read<PurchasesCubit>().addItemChartOfAccounts(purchaseItem);


              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Create',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            100.height,
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd')
        .format(dateTime); // Change the date format here
  }

  Widget _buildInvoiceNumber() {
    // String invoiceNumber =  'Generate';
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Invoice Number',
                style: TextStyle(fontSize: 11),
              ),
              Container(
                color: const Color.fromARGB(255, 200, 200, 200),
                width: 140,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Icon(
                    //   Icons.check,
                    //   color: Colors.black,
                    //   size: 17,
                    // ),
                    // const SizedBox(width: 5),
                    Text(
                      invoiceNumber == 'Generate'
                          ? 'Auto Generate'
                          : invoiceNumber.toUpperCase(),
                      style: TextStyle(
                          color:
                              invoiceNumber == 'Generate' ? null : greenColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                final uid = const Uuid().v1().toString().replaceAll('-', '');

                setState(() {
                  invoiceNumber = uid.substring(0, 7);
                });

                //debugPrint('>> $invoiceNumber');
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }

  Widget _buildAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Billing Address',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: 500,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(3), // Adjust border radius as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // How spread out the shadow is
                  blurRadius: 2, // How blurry the shadow is
                  offset: const Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: TextField(
              controller: billingAddressController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: '',
                border: InputBorder.none,
              ),
            )),
      ],
    );
  }
}
