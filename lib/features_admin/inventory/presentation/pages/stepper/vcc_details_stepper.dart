import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/common.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';

import '../../../../../core/components/dx_date_picker.dart';
import '../../../../../core/components/dx_text.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';
import '../../../../../core/util/decorations.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../../domain/usecases/inventory_usecase.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class VccDetailsStepper extends StatefulWidget {
  static const String vccDetailsStepperScreen = 'vccDetailsStepperScreen';
  InventoryItemEntity? entity;

  VccDetailsStepper({super.key, this.entity});

  @override
  State<VccDetailsStepper> createState() => _VccDetailsStepperState();
}

class _VccDetailsStepperState extends State<VccDetailsStepper> {
  final receivedDateController = TextEditingController();
  final issuedByController = TextEditingController();
  final issuedDateController = TextEditingController();

  final pickedByController = TextEditingController();
  final pickedDateController = TextEditingController();
  final emiratesIdController = TextEditingController();

  String customerId = '';
  String inventoryId = '';

  DateTime? receivedDate;
  DateTime? issuedDate;
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();


    receivedDate = widget.entity?.vcc?.receivedDate;
    issuedDate = widget.entity?.vcc?.issuedDate;
    pickedDate = widget.entity?.vcc?.pickedDate;


    receivedDateController.text =
    (widget.entity?.vcc?.receivedDate?.toIso8601String().isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.vcc?.receivedDate ?? DateTime(0))
        : '';

    // towingDateController.text =
    // (widget.entity?.towing?.towingDate?.toIso8601String().isNotEmpty ??
    //     false)
    //     ? formatDateTime(widget.entity?.towing?.towingDate ?? DateTime(0))
    //     : '';




    issuedByController.text = widget.entity?.vcc?.issuedBy ?? '';

    issuedDateController.text = (widget.entity?.vcc?.issuedDate?.toIso8601String().isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.vcc?.issuedDate ?? DateTime(0))
        : '';

    pickedByController.text = widget.entity?.vcc?.pickedBy ?? '';

    pickedDateController.text = (widget.entity?.vcc?.pickedDate?.toIso8601String().isNotEmpty ??
        false)
        ? formatDateTime(widget.entity?.vcc?.pickedDate ?? DateTime(0))
        : '';;


    emiratesIdController.text = widget.entity?.vcc?.emiratesId ?? '';

    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view == VccDetailsStepper.vccDetailsStepperScreen) {
          if (state.status.isError) {
            //debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);
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
            controller: receivedDateController,
            decoration: defaultInputDecoration(label: 'Received Date'),
            readOnly: true,
            suffix: const Icon(Icons.calendar_month_outlined),
            onTap: () {
              showDxDatePicker(context, onDateSelected: (date, strDate) {
                setState(() {
                  receivedDate = date;
                  receivedDateController.text = formatDateTime(date);
                });
              });
            },
          ),
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: issuedByController,
                decoration: defaultInputDecoration(label: 'Issued By'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: issuedDateController,
                decoration: defaultInputDecoration(label: 'Issued Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () async {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      issuedDate = date;
                      issuedDateController.text = formatDateTime(date);
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
                textFieldType: TextFieldType.NAME,
                controller: pickedByController,
                decoration: defaultInputDecoration(label: 'Picked By'),

              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: pickedDateController,
                decoration: defaultInputDecoration(label: 'Picked Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      pickedDate = date;
                      pickedDateController.text = formatDateTime(date);
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
          BlocBuilder<InventoryBloc, InventoryState>(
            builder: (context, state) {
              if (state.status.isLoading &&
                  (state.view ==
                     VccDetailsStepper.vccDetailsStepperScreen)) {
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
                      screen: VccDetailsStepper.vccDetailsStepperScreen,
                      params: VccParams(
                        receivedDate: receivedDate,
                        issuedBy: issuedByController.text,
                        issuedDate: issuedDate,
                        pickedBy: pickedByController.text,
                        pickedDate: pickedDate,
                        emiratesId: emiratesIdController.text,
                      ),
                      //files: files ?? [],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
