import 'package:flutter/material.dart';
import 'package:hebauto/core/util/constants.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/core/util/ext/widget.dart';
import 'package:hebauto/features_admin/inventory/domain/entity/inventory_entity.dart';

import '../../../dashboard/presentation/widgets/page_controller_provider.dart';
import 'stepper/car_details_stepper.dart';
import 'stepper/invoice_details_stepper.dart';
import 'stepper/port_clearance_details_stepper.dart';
import 'stepper/shipping_details_stepper.dart';
import 'stepper/towing_details_stepper.dart';
import 'stepper/vcc_details_stepper.dart';
import 'stepper/warehouse_details_stepper.dart';

class UpdateInventoryScreen extends StatefulWidget {
  const UpdateInventoryScreen({super.key});

  @override
  State<UpdateInventoryScreen> createState() => _UpdateInventoryScreenState();
}

class _UpdateInventoryScreenState extends State<UpdateInventoryScreen> {
  InventoryItemEntity? entity;

  // we have initialized active step to 0 so that
  // our stepper widget will start from first step
  int _activeCurrentStep = 0;

  // Here we have created list of steps
  // that are required to complete the form
  List<Step> stepList() => [
        // This is step1 which is called Account.
        // Here we will fill our personal details
        Step(
          state:
              _activeCurrentStep == 0 ? StepState.editing : StepState.indexed,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Car Details'),
          content: CarDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),

        Step(
          state:
              _activeCurrentStep == 1 ? StepState.editing : StepState.indexed,
          isActive: _activeCurrentStep >= 1,
          title: const Text('Invoice Details'),
          content: InvoiceDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),
        // This is Step2 here we will enter our address
        Step(
          state:
              _activeCurrentStep == 2 ? StepState.editing : StepState.indexed,
          isActive: _activeCurrentStep >= 2,
          title: const Text('Towing Details'),
          content: TowingDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),

        Step(
          state:
              _activeCurrentStep == 3 ? StepState.complete : StepState.indexed,
          isActive: _activeCurrentStep >= 3,
          title: const Text('Shipping Details'),
          content: ShippingDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),
        Step(
          state:
              _activeCurrentStep == 4 ? StepState.complete : StepState.indexed,
          isActive: _activeCurrentStep >= 4,
          title: const Text('Port Clearance Details'),
          content: PortClearanceDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),

        Step(
          state:
              _activeCurrentStep == 5 ? StepState.complete : StepState.indexed,
          isActive: _activeCurrentStep >= 5,
          title: const Text('Warehouse Details'),
          content: WarehouseDetailsStepper(
            entity: PageControllerProvider.of(context)?.entity,
          ),
        ),

        Step(
          state:
              _activeCurrentStep == 6 ? StepState.complete : StepState.indexed,
          isActive: _activeCurrentStep >= 6,
          title: const Text('VCC'),
          content: VccDetailsStepper( entity: PageControllerProvider.of(context)?.entity,),
        ),
      ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    entity = PageControllerProvider.of(context)?.entity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultWidgetsVerticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(2);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                // FDButton(
                //
                //   text: 'Update',
                //   onTap: () {
                //
                //   },
                // )
              ],
            ),
            defaultWidgetsVerticalSpacing,
            Stepper(
              controlsBuilder: (ctx, bld) {
                return const SizedBox.shrink();
              },
              type: StepperType.horizontal,

              currentStep: _activeCurrentStep,
              steps: stepList(),

              // onStepContinue takes us to the next step
              onStepContinue: () {
                if (_activeCurrentStep < (stepList().length - 1)) {
                  setState(() {
                    _activeCurrentStep += 1;
                  });
                }
              },

              // onStepCancel takes us to the previous step
              onStepCancel: () {
                if (_activeCurrentStep == 0) {
                  return;
                }

                setState(() {
                  _activeCurrentStep -= 1;
                });
              },

              // onStepTap allows to directly click on the particular step we want
              onStepTapped: (int index) {
                setState(() {
                  _activeCurrentStep = index;
                });
              },
            ).expand(),
          ],
        ),
      ),
    );
  }
}
