import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';

import '../../../../../core/components/dx_date_picker.dart';
import '../../../../../core/components/dx_text.dart';
import '../../../../../core/components/dx_upload_file.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';
import '../../../../../core/services/upload_file_service.dart';
import '../../../../../core/util/common.dart';
import '../../../../../core/util/decorations.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../../domain/usecases/inventory_usecase.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class PortClearanceDetailsStepper extends StatefulWidget {
  static const String portClearanceDetailsStepper = 'portClearanceDetailsStepper';
  InventoryItemEntity? entity;

  PortClearanceDetailsStepper({super.key, this.entity});

  @override
  State<PortClearanceDetailsStepper> createState() =>
      _PortClearanceDetailsStepperState();
}

class _PortClearanceDetailsStepperState
    extends State<PortClearanceDetailsStepper> {
  //final shippingDateController = TextEditingController();
  final arrivalDateController = TextEditingController();
  final clearanceDateController = TextEditingController();


  final clearanceAmountController = TextEditingController();


  final vatAmountController = TextEditingController();
  final portWarehouseController = TextEditingController();
  final totalCustomCostController = TextEditingController();


  String customerId = '';
  String inventoryId = '';

  DateTime? arrivalDate;
  DateTime? clearanceDate;
  List<PlatformFile>? files;


  @override
  void initState() {
    super.initState();

    arrivalDate= widget.entity?.port?.arrivalDate;
    clearanceDate= widget.entity?.port?.clearanceDate;


    arrivalDateController.text = (widget.entity?.port?.arrivalDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.port?.arrivalDate ?? DateTime(0))
        : '';

    clearanceDateController.text = (widget
        .entity?.port?.clearanceDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.port?.clearanceDate ?? DateTime(0))
        : '';


    vatAmountController.text = widget.entity?.port?.vatAmountAed ?? '';
    clearanceAmountController.text = widget.entity?.port?.clearanceAmount ?? '';


    portWarehouseController.text =
        widget.entity?.port?.portWarehouseCostAed ?? '';

    totalCustomCostController.text = widget.entity?.port?.customCostAed ?? '';





    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view ==
            PortClearanceDetailsStepper.portClearanceDetailsStepper) {
          if (state.status.isError) {
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);
            Future.delayed(const Duration(seconds: 2), () {
              if (files != null) {
                FileUploadService.uploadImages(
                  inventoryId: state.inventId,
                  category: UploadImageType.PORT.name,
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
                controller: arrivalDateController,
                decoration: defaultInputDecoration(label: 'Arrival Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      arrivalDate = date;
                      arrivalDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: clearanceDateController,
                decoration: defaultInputDecoration(label: 'Clearance Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      clearanceDate = date;
                      clearanceDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),

            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: vatAmountController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'VAT Amount AED'),
              ).expand(),
              20.width,
              FDTextField(
                controller: clearanceAmountController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(
                    label: 'Clearance Amount AED'),
              ).expand(),

            ],
          ),


          Row(
            children: [
              FDTextField(
                controller: portWarehouseController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(
                    label: 'Extra Cost on Arrival'),
              ).expand(),
              20.width,
              FDTextField(
                controller: totalCustomCostController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Total Custom Cost'),
              ).expand(),

            ],
          ),

          50.height,
          Row(
            children: [
              DxFileUpload(
                urls: widget.entity?.port?.images ?? [],
                fileType: FileType.image,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: true,
              ).expand(flex: 2),
              20.width,
              (widget.entity?.port?.images.length ?? 0) > 0
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
                builder: (context, state) {

                  if (state.status.isLoading &&
                      (state.view ==
                          PortClearanceDetailsStepper.portClearanceDetailsStepper)) {
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
                          screen: PortClearanceDetailsStepper
                              .portClearanceDetailsStepper,
                          params: PortParams(
                            arrivalDate: arrivalDate,
                            clearanceDate: clearanceDate,
                            vatAmountAed: vatAmountController.text,
                            clearanceAmount: clearanceAmountController.text,
                            portWarehouseCost: portWarehouseController.text,
                            customCostAed: totalCustomCostController.text,
                          ),
                          //files: files ?? [],
                        ),
                      );
                    },
                  );
                },
              ).expand(flex: 1),
            ],
          )
        ],
      ),
    );
  }
}
