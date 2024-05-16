import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/components/dx_upload_file.dart';
import 'package:hebauto/core/util/common.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';

import '../../../../../core/components/dx_date_picker.dart';
import '../../../../../core/components/dx_text.dart';
import '../../../../../core/components/fd_button.dart';
import '../../../../../core/components/fd_textfield.dart';
import '../../../../../core/services/upload_file_service.dart';
import '../../../../../core/util/decorations.dart';
import '../../../domain/entity/inventory_entity.dart';
import '../../../domain/usecases/inventory_usecase.dart';
import '../../bloc/inventory_bloc.dart';
import '../../bloc/inventory_event.dart';
import '../../bloc/inventory_state.dart';

class InvoiceDetailsStepper extends StatefulWidget {

  InvoiceDetailsStepper({super.key, this.entity});
  static const String invoiceDetailsStepperScreen =
      'invoiceDetailsStepperScreen';

  InventoryItemEntity? entity;

  @override
  State<InvoiceDetailsStepper> createState() => _InvoiceDetailsStepperState();
}

class _InvoiceDetailsStepperState extends State<InvoiceDetailsStepper> {
  final invoiceDateController = TextEditingController();
  final enterAmountController = TextEditingController();
  final hstPstAmountController = TextEditingController();
  final invoiceAmountController = TextEditingController();
  final invoiceNumberController = TextEditingController();
  final invoiceAmountAedController = TextEditingController();
  final invoiceAmountCadController = TextEditingController();
  final totalAmountAedController = TextEditingController();

  String customerId = '';
  String inventoryId = '';

  DateTime? invoiceDate;

  List<PlatformFile>? files;

  @override
  void initState() {
    super.initState();

    invoiceDate = widget.entity?.invoice?.invoiceDate;

    invoiceAmountCadController.text =
        widget.entity?.invoice?.invoiceAmountCad ?? '';
    invoiceAmountAedController.text =
        widget.entity?.invoice?.invoiceAmountAed ?? '';
    invoiceNumberController.text = widget.entity?.invoice?.invoiceNumber ?? '';

    invoiceDateController.text =
        (widget.entity?.invoice?.invoiceDate?.toIso8601String().isNotEmpty ??
                false)
            ? formatDateTime(widget.entity?.invoice?.invoiceDate ?? DateTime(0))
            : '';

    hstPstAmountController.text = widget.entity?.invoice?.hstAmountCad ?? '';
    totalAmountAedController.text =
        widget.entity?.invoice?.totalAmountAed ?? '';

    customerId = widget.entity?.cusId ?? '';
    inventoryId = widget.entity?.inventId ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      listener: (ctx, state) {
        if (state.view == InvoiceDetailsStepper.invoiceDetailsStepperScreen) {
          if (state.status.isError) {
            debugPrint('[$state]');
            state.message.toToastError(context);
          } else if (state.status.isSuccess) {
            state.message.toToastSuccess(context);

            if (files != null) {
              FileUploadService.uploadDocument(
                  inventoryId: inventoryId,
                  file: files?.first ?? PlatformFile(name: '', size: 0),
                  category: UploadPdfType.INVOICE.name,
                  customerEmail: widget.entity?.cusEmail ?? '');
            }
          }
        } else {}
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
                controller: invoiceNumberController,
                decoration: defaultInputDecoration(label: 'Invoice Number'),
              ).expand(),
              20.width,
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: invoiceDateController,
                decoration: defaultInputDecoration(label: 'Invoice Date'),
                readOnly: true,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDxDatePicker(context, onDateSelected: (date, strDate) {
                    setState(() {
                      invoiceDate = date;
                      invoiceDateController.text = formatDateTime(date);
                    });
                  });
                },
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                controller: invoiceAmountCadController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Invoice Amount CAD'),
              ).expand(),
              20.width,
              FDTextField(
                controller: invoiceAmountAedController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'HST/PST Amount CAD'),
              ).expand(),
              20.width,
              FDTextField(
                controller: invoiceAmountAedController,
                textFieldType: TextFieldType.NAME,
                decoration: defaultInputDecoration(label: 'Invoice Amount AED'),
              ).expand(),
            ],
          ),
          Row(
            children: [
              FDTextField(
                textFieldType: TextFieldType.NAME,
                controller: totalAmountAedController,
                decoration: defaultInputDecoration(label: 'Total amount AED'),
              ).expand(),
            ],
          ),
          50.height,
          Row(
            children: [
              DxFileUpload(
                urls: [widget.entity?.invoice?.invoiceUrl ?? ''],
                fileType: FileType.media,
                pickerCallback: (result) {
                  files = result;
                },
                allowMultiple: false,
              ).expand(flex: 2),
              20.width,
              if ((widget.entity?.invoice?.invoiceUrl.isEmptyOrNull ?? false) ||
                  (widget.entity?.invoice?.invoiceUrl != 'N/A'))
                DxFileUpload(
                  fileType: FileType.media,
                  pickerCallback: (result) {
                    files = result;
                  },
                  allowMultiple: false,
                ).expand(flex: 2)
              else
                Container().expand(flex: 2),
              20.width,
              BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  if (state.status.isLoading &&
                      (state.view ==
                          InvoiceDetailsStepper.invoiceDetailsStepperScreen)) {
                    return const Align(
                      alignment: Alignment.center,
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
                              screen: InvoiceDetailsStepper
                                  .invoiceDetailsStepperScreen,
                              params: InvoiceParams(
                                  invoiceNumber: invoiceNumberController.text,
                                  invoiceAmountCad:
                                      invoiceAmountCadController.text,
                                  hstAmountCad: hstPstAmountController.text,
                                  invoiceAmountAed:
                                      invoiceAmountAedController.text,
                                  totalAmountAed: totalAmountAedController.text,
                                  invoiceDate: invoiceDate),
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
