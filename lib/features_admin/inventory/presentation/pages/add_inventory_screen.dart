import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/customer_profile_state.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/components/dx_upload_file.dart';
import '../../../../core/components/fd_button.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/services/upload_file_service.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/decorations.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../../../customer_profile/presentation/bloc/customer_profile_event.dart';
import '../../../customer_profile/presentation/bloc/cutomer_profile_bloc.dart';
import '../../domain/usecases/inventory_usecase.dart';
import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';
import '../widget/select_customer.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({super.key});

  static const String addInventoryScreen = 'addInventoryScreen';

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  final invoiceNumberController = TextEditingController();
  final invoiceDateController = TextEditingController();
  final enterAmountController = TextEditingController();
  final hstPstAmountController = TextEditingController();
  final invoiceAmountController = TextEditingController();
  final totalAmountInAEDController = TextEditingController();
  final carNameAndMakeController = TextEditingController();
  final colorController = TextEditingController();
  final yearOfManufactureController = TextEditingController();
  final vinNumberController = TextEditingController();
  final lotNumberController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to fetch data every time the route changes
    if (ModalRoute.of(context)?.isCurrent == true) {
      context.read<CustomerProfileBloc>().add(FetchCustomersEvent(page: 1, screen: ''));
    }
  }

  void resetStates() {
    // Reset controllers
    invoiceNumberController.clear();
    invoiceDateController.clear();
    enterAmountController.clear();
    hstPstAmountController.clear();
    invoiceAmountController.clear();
    totalAmountInAEDController.clear();
    carNameAndMakeController.clear();
    colorController.clear();
    yearOfManufactureController.clear();
    vinNumberController.clear();
    lotNumberController.clear();





    // Reset other entities or variables
    setState(() {
      customer = null;
      files = null;
      key.currentState?.reset();
      selectedOption = 1;
    });

  }


  GlobalKey<DxFileUploadState> key = GlobalKey<DxFileUploadState>();


  final _formKey = GlobalKey<FormState>();

  CustomerEntity? customer;
  List<PlatformFile>? files;

  // Define focus nodes
  FocusNode carNameAndMakeFocusNode = FocusNode();
  FocusNode colorFocusNode = FocusNode();
  FocusNode yearOfManufactureFocusNode = FocusNode();
  FocusNode vinNumberFocusNode = FocusNode();
  FocusNode lotNumberFocusNode = FocusNode();
  FocusNode keyFocusNode = FocusNode();

  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view ==  AddInventoryScreen.addInventoryScreen) {
          if (state.status.isError) {
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);
            Future.delayed(const Duration(seconds: 2) , (){
              FileUploadService.uploadImages(
                inventoryId: state.inventId,
                category: UploadImageType.VEHICLE.name,
                customerEmail: customer?.email ?? '',
                files: files ?? [],
              );

              resetStates();
            });
          }
        }
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  defaultWidgetsVerticalSpacing,
                  const DxText(
                    text: 'Add Inventory',
                    isBold: true,
                    align: TextAlign.left,
                    size: 30,
                  ),
                  defaultWidgetsVerticalSpacing,
                  Row(
                    children: [
                      DxFileUpload(
                        key: key,
                        fileType: FileType.image,
                        pickerCallback: (images) {
                          files = images;
                        },
                      ).expand(flex: 2),
                      // 10.width,
                      // DxFileUpload(
                      //   fileType: FileType.media,
                      //   allowMultiple: false,
                      //   pickerCallback: (images) {
                      //     files = images;
                      //   },
                      // ).expand(flex: 1),
                    ],
                  ),
                  defaultWidgetsVerticalSpacing,
                  BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
                    builder: (context, state) {
                      return SearchCustomerDropDown(
                        customers: state.data,
                        customerCallback: (value) {
                          customer = value;


                        },
                      );
                    },
                  ),
                  // Row(
                  //   children: [
                  //     FDTextField(
                  //       controller: invoiceNumberController,
                  //       textFieldType: TextFieldType.NAME,
                  //       decoration:
                  //           defaultInputDecoration(label: 'Invoice number*'),
                  //       validator: validateTextField,
                  //     ).expand(),
                  //     defaultWidgetsHorizontalSpacing,
                  //     FDTextField(
                  //       controller: invoiceDateController,
                  //       textFieldType: TextFieldType.NAME,
                  //       decoration:
                  //           defaultInputDecoration(label: 'Invoice Date'),
                  //       validator: validateTextField,
                  //     ).expand(),
                  //   ],
                  // ),
                  // defaultWidgetsVerticalSpacing,
                  // Row(
                  //   children: [
                  //     FDTextField(
                  //       controller: enterAmountController,
                  //       textFieldType: TextFieldType.NAME,
                  //       decoration:
                  //           defaultInputDecoration(label: 'Enter Amount'),
                  //       validator: validateTextField,
                  //     ).expand(),
                  //     defaultWidgetsHorizontalSpacing,
                  //     FDTextField(
                  //       controller: hstPstAmountController,
                  //       textFieldType: TextFieldType.NAME,
                  //       decoration:
                  //           defaultInputDecoration(label: 'HST/PST Amount'),
                  //       validator: validateTextField,
                  //     ).expand(),
                  //     defaultWidgetsHorizontalSpacing,
                  //     FDTextField(
                  //       controller: invoiceAmountController,
                  //       textFieldType: TextFieldType.NAME,
                  //       decoration:
                  //           defaultInputDecoration(label: 'Invoice Amount'),
                  //       validator: validateTextField,
                  //     ).expand(),
                  //   ],
                  // ),
                  // defaultWidgetsVerticalSpacing,
                  // FDTextField(
                  //   controller: totalAmountInAEDController,
                  //   textFieldType: TextFieldType.NAME,
                  //   decoration:
                  //       defaultInputDecoration(label: 'Total amount in AED'),
                  //   validator: validateTextField,
                  // ),
                  defaultWidgetsVerticalSpacing,
                  FDTextField(
                    controller: carNameAndMakeController,
                    textFieldType: TextFieldType.NAME,
                    decoration:
                        defaultInputDecoration(label: 'Car Name & Make'),
                    validator: validateTextField,
                    textInputAction: TextInputAction.next,
                    focus: carNameAndMakeFocusNode,
                    nextFocus: colorFocusNode,

                  ),
                  defaultWidgetsVerticalSpacing,
                  Row(
                    children: [
                      FDTextField(
                        controller: colorController,
                        textFieldType: TextFieldType.NAME,
                        focus: colorFocusNode,
                        nextFocus: yearOfManufactureFocusNode,
                        decoration: defaultInputDecoration(label: 'Color'),
                        validator: validateTextField,

                        textInputAction: TextInputAction.next,
                      ).expand(),
                      defaultWidgetsHorizontalSpacing,
                      FDTextField(
                        controller: yearOfManufactureController,
                        textFieldType: TextFieldType.NAME,
                        decoration: defaultInputDecoration(
                            label: 'Year of manufacture'),
                        validator: validateTextField,
                        textInputAction: TextInputAction.next,
                        focus: yearOfManufactureFocusNode,
                        nextFocus: vinNumberFocusNode,
                      ).expand(),

                      //DxText(text: '').expand(),
                    ],
                  ),
                  defaultWidgetsVerticalSpacing,
                  Row(
                    children: [
                      FDTextField(
                        controller: vinNumberController,
                        textFieldType: TextFieldType.NAME,
                        decoration: defaultInputDecoration(label: 'Vin number'),
                        validator: validateTextField,
                        textInputAction: TextInputAction.next,
                        focus: vinNumberFocusNode,
                        nextFocus: lotNumberFocusNode,
                      ).expand(),
                      defaultWidgetsHorizontalSpacing,
                      FDTextField(
                        controller: lotNumberController,
                        textFieldType: TextFieldType.NAME,
                        decoration: defaultInputDecoration(label: 'Lot number'),
                        validator: validateTextField,
                        textInputAction: TextInputAction.next,
                        focus: lotNumberFocusNode,
                        nextFocus: keyFocusNode,
                      ).expand(),
                    ],
                  ),
                  defaultWidgetsVerticalSpacing,
                  Focus(
                    focusNode: keyFocusNode,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const DxText(
                          text: 'Is Key Available? ',
                          isBold: true,
                          size: 15,
                          align: TextAlign.start,
                        ).expand(),
                        RadioListTile<int>(
                          title: const Text('Yes'),
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value ?? 1;
                            });
                          },
                        ).expand(),
                        RadioListTile<int>(
                          title: const Text('No'),
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              selectedOption = value ?? 1;
                            });
                          },
                        ).expand(),
                        const SizedBox().expand(flex: 2)
                      ],
                    ),
                  ),
                  BlocBuilder<InventoryBloc, InventoryState>(
                    builder: (context, state) {
                      if (state.status.isLoading &&
                          (state.view ==
                               AddInventoryScreen.addInventoryScreen)) {
                        return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      }
                      return FDButton(
                        width: context.width() / 2,
                        text: 'Add Car',
                        onTap: () {

                          if (_formKey.currentState?.validate() ?? false) {
                            final uid = const Uuid()
                                .v1()
                                .toString()
                                .replaceAll('-', '');
                            context.read<InventoryBloc>().add(
                                  AddInventoryEvent(
                                    screen: AddInventoryScreen.addInventoryScreen,
                                    params: InventoryParams(
                                      inventId: uid,
                                      cusId: customer?.cusId ?? '',
                                      cusEmail: customer?.email ?? '',
                                      cusName: customer?.name ?? '',
                                      cusCompany: customer?.companyName ?? '',
                                      vehicleName: carNameAndMakeController.text,
                                      color: colorController.text,
                                      yearOfManufacture: yearOfManufactureController.text,
                                      lotNumber: lotNumberController.text,
                                      vinNumber: vinNumberController.text,
                                      isKey: selectedOption == 1 ? true : false,
                                    ),
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  defaultWidgetsVerticalSpacing,
                  defaultWidgetsVerticalSpacing,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    invoiceNumberController.dispose();
    invoiceDateController.dispose();
    enterAmountController.dispose();
    hstPstAmountController.dispose();
    invoiceAmountController.dispose();
    totalAmountInAEDController.dispose();
    carNameAndMakeController.dispose();
    colorController.dispose();
    yearOfManufactureController.dispose();
    vinNumberController.dispose();
    lotNumberController.dispose();
    super.dispose();
  }

  String? validateTextField(String? value) {
    if (value?.isEmpty ?? false) {
      return 'This field is required!';
    }
    return null;
  }
}
