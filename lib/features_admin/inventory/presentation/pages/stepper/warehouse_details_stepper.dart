import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:hebauto/features_admin/inventory/domain/usecases/inventory_usecase.dart';

import '../../../../../core/components/dx_date_picker.dart';
import '../../../../../core/components/dx_text.dart';
import '../../../../../core/components/dx_upload_file.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';
import '../../../../../core/services/upload_file_service.dart';
import '../../../../../core/util/common.dart';
import '../../../../../core/util/decorations.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class WarehouseDetailsStepper extends StatefulWidget {

  static const String warehouseDetailsStepperScreen = 'warehouseDetailsStepperScreen';
  InventoryItemEntity? entity;

  WarehouseDetailsStepper({super.key, this.entity});

  @override
  State<WarehouseDetailsStepper> createState() =>
      _WarehouseDetailsStepperState();
}

class _WarehouseDetailsStepperState extends State<WarehouseDetailsStepper> {
  final warehouseNameController = TextEditingController();
  final arrivalDateController = TextEditingController();

  final storageCostAedController = TextEditingController();
  final pickingDateController = TextEditingController();
  final authorizedByController = TextEditingController();
  final authorizedDateController = TextEditingController();
  final pickedByController = TextEditingController();
  final pickedDateController = TextEditingController();
  final emiratesIdController = TextEditingController();

  String customerId = '';
  String inventoryId = '';

  DateTime? arrivalDate;
  DateTime? pickingDate;
  DateTime? authorizedDate;
  DateTime? pickedDate;

  List<PlatformFile>? files;
  PlatformFile? emiratesId;

  @override
  void initState() {
    super.initState();


    arrivalDate = widget.entity?.warehouse?.arrivalDate;
    pickingDate = widget.entity?.warehouse?.pickingDate;
    pickedDate = widget.entity?.warehouse?.pickedDate;
    authorizedDate = widget.entity?.warehouse?.authorizedDate;

    warehouseNameController.text = widget.entity?.warehouse?.name ?? '';


    arrivalDateController.text = (widget.entity?.warehouse?.arrivalDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.warehouse?.arrivalDate ?? DateTime(0))
        : '';

    //arrivalDateController.text =  widget.entity?.warehouse?.arrivalDate?.toIso8601String() ?? '';
    storageCostAedController.text = widget.entity?.warehouse?.storageCost ?? '';



    pickingDateController.text = (widget.entity?.warehouse?.pickingDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.warehouse?.pickingDate ?? DateTime(0))
        : '';


    //pickingDateController.text =  widget.entity?.warehouse?.pickingDate?.toIso8601String() ?? '';
    authorizedByController.text = widget.entity?.warehouse?.authorizedBy ?? '';
    //authorizedDateController.text =  widget.entity?.warehouse?.authorizedDate?.toIso8601String() ?? '';
    authorizedDateController.text = (widget.entity?.warehouse?.authorizedDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.warehouse?.arrivalDate ?? DateTime(0))
        : '';

    pickedByController.text = widget.entity?.warehouse?.pickedBy ?? '';
    //pickedDateController.text =  widget.entity?.warehouse?.pickingDate?.toIso8601String() ?? '';
    pickedDateController.text = (widget.entity?.warehouse?.pickedDate
        ?.toIso8601String()
        .isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.warehouse?.pickedDate ?? DateTime(0))
        : '';

    emiratesIdController.text = widget.entity?.warehouse?.emiratesId ?? '';








    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view ==
            WarehouseDetailsStepper.warehouseDetailsStepperScreen) {
          if (state.status.isError) {
            //debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);

            if (files != null) {
              FileUploadService.uploadImages(
                inventoryId: state.inventId,
                category: UploadImageType.WAREHOUSE.name,
                customerEmail: widget.entity?.cusEmail ?? '',
                files: files ?? [],
              );
            }
            if (emiratesId != null) {
              FileUploadService.uploadImages(
                inventoryId: state.inventId,
                category: UploadImageType.WAREHOUSEID.name,
                customerEmail: widget.entity?.cusEmail ?? '',
                files: [emiratesId ?? PlatformFile(name: '', size: 0)],
              );
            }
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
          FDTextField(
            textFieldType: TextFieldType.NAME,
            controller: warehouseNameController,
            decoration: defaultInputDecoration(label: 'Warehouse Name'),
          ),
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
                controller: storageCostAedController,
                decoration: defaultInputDecoration(label: 'Storage Cost AED'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: pickingDateController,
                decoration: defaultInputDecoration(label: 'Picking Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      pickingDate = date;
                      pickingDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
              20.width,
            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: authorizedByController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Authorized By'),
              ).expand(),
              20.width,
              FDTextField(
                controller: authorizedDateController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      authorizedDate = date;
                      authorizedDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: pickedByController,
                decoration: defaultInputDecoration(label: 'Picked By'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: pickedDateController,
                decoration: defaultInputDecoration(label: 'Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      pickedDate = date;
                      pickingDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: emiratesIdController,
                decoration: defaultInputDecoration(label: 'Emirates Id'),
              ).expand(),
              20.width,
            ],
          ),
          50.height,
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      DxFileUpload(
                        urls: widget.entity?.warehouse?.images ?? [],
                        fileType: FileType.image,
                        pickerCallback: (result) {
                          files = result;
                        },
                        allowMultiple: true,
                      ).expand(flex: 2),
                      20.width,
                      (widget.entity?.warehouse?.images.length ?? 0) > 0
                          ? DxFileUpload(
                        fileType: FileType.image,
                        pickerCallback: (result) {
                          files = result;
                        },
                        allowMultiple: true,
                      ).expand(flex: 2)
                          : Container().expand(flex: 2),
                      20.width,
                    ],
                  ),
                  10.height,
                  Row(
                    children: [
                      DxFileUpload(
                        urls: [widget.entity?.warehouse?.idUrl ?? ''] ,
                        fileType: FileType.image,
                        pickerCallback: (result) {
                          files = result;
                        },
                        allowMultiple: false,
                      ).expand(flex: 2),
                      20.width,
                      ((widget.entity?.warehouse?.idUrl.isEmptyOrNull ??  false) || (widget.entity?.warehouse?.idUrl != 'N/A'))
                          ? DxFileUpload(
                        fileType: FileType.image,
                        pickerCallback: (result) {
                          files = result;
                        },
                        allowMultiple: false,
                      ).expand(flex: 2)
                          : Container().expand(flex: 2),
                      20.width,
                    ],
                  )
                ],
              ).expand(flex: 2),
              BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  if (state.status.isLoading &&
                      (state.view == WarehouseDetailsStepper.warehouseDetailsStepperScreen)) {
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
                          screen: WarehouseDetailsStepper
                              .warehouseDetailsStepperScreen,
                          params: WarehouseParams(
                              name: warehouseNameController.text,
                              arrivalDate: arrivalDate,
                              storageCost: storageCostAedController.text,
                              pickingDate: pickingDate,
                              authorizedBy: authorizedByController.text,
                              authorizedDate: authorizedDate,
                              pickedBy: pickedByController.text,
                              pickedDate: pickingDate,
                              emiratesId: emiratesIdController.text),
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
