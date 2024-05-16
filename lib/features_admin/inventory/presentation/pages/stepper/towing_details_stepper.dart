import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/common.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:hebauto/features_admin/inventory/domain/usecases/inventory_usecase.dart';

import '../../../../../core/components/dx_date_picker.dart';
import '../../../../../core/components/dx_text.dart';
import '../../../../../core/components/dx_upload_file.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';
import '../../../../../core/services/upload_file_service.dart';
import '../../../../../core/util/decorations.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class TowingDetailsStepper extends StatefulWidget {
  static const String towingDetailsStepperScreen = 'towingDetailsStepperScreen';
  InventoryItemEntity? entity;

  TowingDetailsStepper({super.key, this.entity});

  @override
  State<TowingDetailsStepper> createState() => _TowingDetailsStepperState();
}

class _TowingDetailsStepperState extends State<TowingDetailsStepper> {
  final departurePortController = TextEditingController();
  final towingDateController = TextEditingController();
  final warehouseDeliveryDate = TextEditingController();
  final towingLocationController = TextEditingController();
  final totalCostCadController = TextEditingController();
  final totalCostAedController = TextEditingController();

  String customerId = '';
  String inventoryId = '';

  DateTime? towingDate;
  DateTime? deliveryDate;

  List<PlatformFile>? files;

  @override
  void initState() {
    super.initState();

    departurePortController.text = widget.entity?.towing?.departurePort ?? '';
    totalCostAedController.text = widget.entity?.towing?.towingCostAed ?? '';
    totalCostCadController.text = widget.entity?.towing?.towingCostCad ?? '';
    towingLocationController.text = widget.entity?.towing?.towingCity ?? '';
    towingDateController.text =
        (widget.entity?.towing?.towingDate?.toIso8601String().isNotEmpty ??
                false)
            ? formatDateTime(widget.entity?.towing?.towingDate ?? DateTime(0))
            : '';

    warehouseDeliveryDate.text =
    (widget.entity?.towing?.warehouseDeliveryDate?.toIso8601String().isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.towing?.warehouseDeliveryDate ?? DateTime(0))
        : '';


    // (widget.entity?.towing?.towingDate
    //     ?.toIso8601String()
    //     .isNotEmpty ??
    //     false)
    //     ? formatDateTime(widget.entity?.towing?.towingDate ?? DateTime(0))
    //     : '';

    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view == TowingDetailsStepper.towingDetailsStepperScreen) {
          if (state.status.isError) {
            //debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);

            if (files != null) {
              Future.delayed(
                const Duration(seconds: 2),
                () {
                  FileUploadService.uploadImages(
                    inventoryId: state.inventId,
                    category: UploadImageType.TOWING.name,
                    customerEmail: widget.entity?.cusEmail ?? '',
                    files: files ?? [],
                  );
                },
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
            controller: departurePortController,
            // onChanged: (value){
            //   departurePortController.text = value;
            // },
            decoration: defaultInputDecoration(label: 'Departure Port'),
          ),
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: towingLocationController,
                decoration: defaultInputDecoration(label: 'Towing Location'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: towingDateController,
                decoration: defaultInputDecoration(label: 'Towing Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      towingDate = date;
                      towingDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: warehouseDeliveryDate,
                decoration:
                    defaultInputDecoration(label: 'Warehouse Delivery Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      deliveryDate = date;
                      warehouseDeliveryDate.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: totalCostCadController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Total Cost in CAD'),
              ).expand(),
              20.width,
              FDTextField(
                controller: totalCostAedController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Total Cost in AED'),
              ).expand(),
            ],
          ),
          50.height,
          Row(
            children: [
              DxFileUpload(
                urls: widget.entity?.towing?.images ?? [],
                fileType: FileType.image,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: true,
              ).expand(flex: 2),
              20.width,
              (widget.entity?.towing?.images.length ?? 0) > 0
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
                          TowingDetailsStepper.towingDetailsStepperScreen)) {
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
                              screen: TowingDetailsStepper
                                  .towingDetailsStepperScreen,
                              params: TowingParams(
                                departurePort: departurePortController.text,
                                towingCity: towingLocationController.text,
                                towingDate: towingDate,
                                deliveryDate: deliveryDate,
                                towingCostAed: totalCostAedController.text,
                                towingCostCad: totalCostCadController.text,
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
