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

class ShippingDetailsStepper extends StatefulWidget {
  static const String shippingDetailsStepperScreen =
      'shippingDetailsStepperScreen';
  InventoryItemEntity? entity;

  ShippingDetailsStepper({super.key, this.entity});

  @override
  State<ShippingDetailsStepper> createState() => _ShippingDetailsStepperState();
}

class _ShippingDetailsStepperState extends State<ShippingDetailsStepper> {
  final shippingDateController = TextEditingController();
  final containerNumberController = TextEditingController();

  final offLoadingPortController = TextEditingController();
  final shippingCostAedController = TextEditingController();
  final shippingCostCadController = TextEditingController();
  final expectedArrivalDateController = TextEditingController();
  final bookingNumberController = TextEditingController();

  String customerId = '';
  String inventoryId = '';

  DateTime? shippingDate;
  DateTime? expArrivalDate;

  List<PlatformFile>? files;

  @override
  void initState() {
    super.initState();

    expArrivalDate = widget.entity?.shipping?.expArrivalDate;
    shippingDate = widget.entity?.shipping?.shippingDate;

    offLoadingPortController.text =
        widget.entity?.shipping?.offLoadingPort ?? '';

    containerNumberController.text =
        widget.entity?.shipping?.containerNumber ?? '';

    bookingNumberController.text = widget.entity?.shipping?.bookingNumber ?? '';

    shippingDateController.text = (widget.entity?.shipping?.shippingDate
                ?.toIso8601String()
                .isNotEmpty ??
            false)
        ? formatDateTime(widget.entity?.shipping?.shippingDate ?? DateTime(0))
        : '';

    expectedArrivalDateController.text = (widget
                .entity?.shipping?.expArrivalDate
                ?.toIso8601String()
                .isNotEmpty ??
            false)
        ? formatDateTime(widget.entity?.shipping?.expArrivalDate ?? DateTime(0))
        : '';

    shippingCostAedController.text =
        widget.entity?.shipping?.shippingCostAed ?? '';
    shippingCostCadController.text =
        widget.entity?.shipping?.shippingCostCad ?? '';

    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view == ShippingDetailsStepper.shippingDetailsStepperScreen) {
          if (state.status.isError) {
            //debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);

            if (files != null) {
              Future.delayed(const Duration(seconds: 2), () {
                FileUploadService.uploadImages(
                  inventoryId: state.inventId,
                  category: UploadImageType.SHIPPING.name,
                  customerEmail: widget.entity?.cusEmail ?? '',
                  files: files ?? [],
                );
              });
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
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: containerNumberController,
                decoration: defaultInputDecoration(label: 'Container Number'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: bookingNumberController,
                decoration: defaultInputDecoration(label: 'Booking Number'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: shippingDateController,
                decoration: defaultInputDecoration(label: 'Shipping Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      shippingDate = date;
                      shippingDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: expectedArrivalDateController,
                textFieldType: TextFieldType.NAME,
                decoration:
                    defaultInputDecoration(label: 'Expected Arrival Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      expArrivalDate = date;
                      expectedArrivalDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
              20.width,
              FDTextField(
                controller: shippingCostCadController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Shipping Cost CAD'),
              ).expand(),
              20.width,
              FDTextField(
                controller: shippingCostAedController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Shipping Cost AED'),
              ).expand(),
            ],
          ),
          FDTextField(
            textFieldType: TextFieldType.NAME,
            controller: offLoadingPortController,
            decoration: defaultInputDecoration(label: 'Offloading Port'),
          ),
          50.height,
          Row(
            children: [
              DxFileUpload(
                urls: widget.entity?.shipping?.images ?? [],
                fileType: FileType.image,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: true,
              ).expand(flex: 2),
              20.width,
              (widget.entity?.shipping?.images.length ?? 0) > 0
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
                          ShippingDetailsStepper
                              .shippingDetailsStepperScreen)) {
                    return const Align(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return FDButton(
                    text: 'Update',
                    width: context.width(),
                    onTap: () {
                      context.read<InventoryBloc>().add(
                            UpdateInventoryEvent(
                              uid: inventoryId,
                              screen: ShippingDetailsStepper
                                  .shippingDetailsStepperScreen,
                              params: ShippingParams(
                                containerNumber: containerNumberController.text,
                                bookingNumber: bookingNumberController.text,
                                shippingDate: shippingDate,
                                offLoadingPort: offLoadingPortController.text,
                                expArrivalDate: expArrivalDate,
                                shippingCostAed: shippingCostAedController.text,
                                shippingCostCad: shippingCostCadController.text,
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
