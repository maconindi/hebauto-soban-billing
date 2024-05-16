import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';

import '../../../../../core/components/dx_upload_file.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';

import '../../../../../core/services/upload_file_service.dart';
import '../../../../../core/util/util.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../../domain/usecases/inventory_usecase.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class CarDetailsStepper extends StatefulWidget {
  static const String carDetailsStepperScreen = 'carDetailsStepperScreen';
  CarDetailsStepper({super.key, this.entity});

  InventoryItemEntity? entity;

  @override
  State<CarDetailsStepper> createState() => _CarDetailsStepperState();
}

class _CarDetailsStepperState extends State<CarDetailsStepper> {
  //final invoiceNumberController = TextEditingController();
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

  int selectedOption = 1;

  String customerId = '';
  String inventoryId = '';

  List<PlatformFile>? files;

  @override
  void initState() {
    super.initState();

    //invoiceNumberController.text = widget.entity?.invoiceNo ?? '';
    //invoiceDateController.text = widget.entity?.exptShippingDate?.toIso8601String() ?? '';

    lotNumberController.text = widget.entity?.vehicle?.lotNumber ?? '';
    vinNumberController.text = widget.entity?.vehicle?.vinNumber ?? '';
    yearOfManufactureController.text = widget.entity?.vehicle?.year ?? '';
    colorController.text = widget.entity?.vehicle?.color ?? '';

    carNameAndMakeController.text = widget.entity?.vehicle?.name ?? '';
    totalAmountInAEDController.text = '';
    invoiceAmountController.text = '';
    hstPstAmountController.text = '';
    enterAmountController.text = '';
    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';

    selectedOption = widget.entity?.vehicle?.isKey.getIntBool() ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view == CarDetailsStepper.carDetailsStepperScreen) {
          if (state.status.isError) {
            //debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);
            Future.delayed(const Duration(seconds: 2) , (){

              if(files != null){
                FileUploadService.uploadImages(
                  inventoryId: state.inventId,
                  category: UploadImageType.VEHICLE.name,
                  customerEmail: widget.entity?.cusEmail ?? '',
                  files: files ?? [],
                );
              }

            });
          }
        }
      },
      child: Column(
        children: [
          50.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DxText(
                text: 'Car Name : ${widget.entity?.vehicle?.name}',
                size: 15,
                isBold: true,
              ),
              DxText(
                text: 'Customer : ${widget.entity?.cusEmail}',
                size: 15,
                isBold: true,
              )
            ],
          ),
          20.height,
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: colorController,
                decoration: defaultInputDecoration(label: 'Color'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: yearOfManufactureController,
                decoration: defaultInputDecoration(label: 'Year'),
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: lotNumberController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Lot Number'),
              ).expand(),
              20.width,
              FDTextField(
                controller: vinNumberController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Vin Number'),
              ).expand(),
            ],
          ),
          Row(
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
                value: 0,
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
          50.height,
          Row(
            children: [
              DxFileUpload(
                urls: widget.entity?.vehicle?.images ?? [] ,
                fileType: FileType.image,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: true,
              ).expand(flex: 2),
              20.width,
              (widget.entity?.vehicle?.images.length ?? 0) > 0
                  ? DxFileUpload(
                fileType: FileType.image,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: true,
              ).expand(flex: 2)
                  : Container().expand(flex: 2),
              20.width,
              BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context , state) {

                  if (state.status.isLoading &&
                      (state.view ==
                          CarDetailsStepper.carDetailsStepperScreen)) {
                    return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  }
                  return FDButton(
                    text: 'Update',
                    width: context.width(),
                    onTap: () {
                      context.read<InventoryBloc>().add(
                            UpdateInventoryEvent(
                              uid: inventoryId,
                              screen: CarDetailsStepper.carDetailsStepperScreen,
                              params: VehicleParams(
                                vehicleName: carNameAndMakeController.text,
                                color: colorController.text,
                                yearOfManufacture: yearOfManufactureController.text,
                                lotNumber: lotNumberController.text,
                                vinNumber: vinNumberController.text,
                                isKey: selectedOption == 1 ? true : false,
                              ),
                              //files: files ?? [],
                            ),
                          );
                    },
                  ).expand(flex: 1);
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}
