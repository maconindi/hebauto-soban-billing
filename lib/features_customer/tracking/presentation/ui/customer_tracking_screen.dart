import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_customer/tracking/presentation/bloc/customer_tracking_bloc.dart';

import '../../../../core/components/dx_text.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/util.dart';
import '../../domain/usecase/track_inventory_usecase.dart';
import '../bloc/customer_tracking_event.dart';
import '../bloc/customer_tracking_state.dart';


class CustomerTrackingScreen extends StatefulWidget {
  const CustomerTrackingScreen({super.key});

  @override
  State<CustomerTrackingScreen> createState() => _CustomerTrackingScreenState();
}

class _CustomerTrackingScreenState extends State<CustomerTrackingScreen> {
  final vinLotNumberController = TextEditingController();

  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: context.isPhone() ?const EdgeInsets.symmetric(horizontal: 10):  const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            defaultWidgetsVerticalSpacing,
            context.isPhone() ? Align(
              alignment: Alignment.centerLeft,
              child: DxText(
                isMobileHeading: true,
                text: 'Tracking',
                size: 15,
        
                isBold: true,
              ),
            ):  Column(
              children: [
                Icon(
                  Icons.track_changes_rounded,
                  size: 50,
                  color: kPrimaryColor,
                ),
                const DxText(
                  text: 'Progress Tracking Update',
                  isBold: true,
                  size: 30,
                  color: black,
                ),
              ],
            ),
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
            FDTextField(
              textFieldType: TextFieldType.NAME,
              controller: vinLotNumberController,
              // suffix: IconButton(
              //   onPressed: () {
              //
              //
              //     context.read<CustomerTrackingBloc>().add(
              //       TrackingCarEvent(
              //           params: TrackingParams(
              //             vinNumber: vinLotNumberController.text,
              //             lotNumber: vinLotNumberController.text,
              //           )),
              //     );
              //   },
              //   icon: const Icon(Icons.search_rounded),
              // ),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Email is required';
                } else {
                  return null;
                }
              },
              onChanged: _onSearchChanged,
              decoration: defaultInputDecoration(hint: 'Vin Number/Lot Number'),
            ),
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
            defaultWidgetsVerticalSpacing,
        
        
            BlocBuilder<CustomerTrackingBloc, CustomerTrackingState>(
              builder: (context, state) {
        
                if (state.status.isError) {
                  return Text(state.message);
                }
                if (state.status.isLoading) {
                  return const CircularProgressIndicator();
                }
                if (state.status.isSuccess) {
                  return Column(
                    children: [
                  
                      Container(
                        height: 170,
                        width: context.isPhone() ? context.width() : context.width() / 3,
                        decoration:
                        boxDecorationWithRoundedCorners(backgroundColor: black),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            10.height,
                            const DxText(
                              text: 'Container Number',
                              color: Colors.white,
                              isBold: true,
                              size: 20,
                            ),
                            DxText(
                              text: state.data.shipping?.containerNumber.validate(value: 'N/A') ?? 'N/A',
                              size: 20,
                              color: Colors.white,
                            ),
                            20.height,
                            const DxText(
                              text: 'Booking Number',
                              color: Colors.white,
                              isBold: true,
                              size: 20,
                            ),
                            DxText(
                              text: state.data.shipping?.bookingNumber.validate(value: 'N/A') ?? 'N/A',
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                  
                      10.height,
                      Column(
                        children: [
                          DxText(text: state.data.vehicle?.name ?? 'N/A' , color: blueColor, isBold:  true, size: 20,),
                          5.height,
                          DxText(text: '${state.data.vehicle?.color.validate(value: 'N/A') ?? 'N/A'} | ${state.data.vehicle?.year.validate(value: 'N/A') ?? 'N/A'}', color: blueColor, isBold:  true, size: 20,)
                        ],
                      ),
                      10.height,
                  
                      DxText(
                        text:
                        'Vin: ${state.data.vehicle?.vinNumber.validate(value: 'N/A') ?? 'N/A'} ${context.isPhone() ? '\n' : '|'} Lot: ${state.data.vehicle?.lotNumber.validate(value: 'N/A') ?? 'N/A'}',
                        color: kPrimaryColor,
                        isBold: true,
                        size: 25,
                      ),
                  
                      10.height,
                      defaultWidgetsVerticalSpacing,
                      defaultWidgetsVerticalSpacing,
                      defaultWidgetsVerticalSpacing,
                  
                      if (context.isPhone()) SizedBox(
                        height: 1000,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),
                                10.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.vehicle?.createdAt ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Shipping Created',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                    5.height,
                                  ],
                                ).expand(),

                              ],
                            ),
                            5.height,
                            Container(
                              color:state.data.towing?.towingDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.towing?.towingDate != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.towing?.towingDate != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),
                                10.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.towing?.towingDate ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Towing',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                    5.height,
                                  ],
                                ).expand(),

                              ],
                            ),
                            5.height,
                            Container(
                              color:state.data.towing?.warehouseDeliveryDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.towing?.warehouseDeliveryDate != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.towing?.warehouseDeliveryDate != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),

                                10.width,

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.towing?.warehouseDeliveryDate ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Warehouse CAD',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                  ],
                                ).expand(),

                              ],
                            ),
                            5.height,
                            Container(
                              color:state.data.shipping?.shippingDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      //margin: const EdgeInsets.only(bottom: 40),
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.shipping?.shippingDate != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.shipping?.shippingDate != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),

                                10.width,


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.shipping?.shippingDate ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Shipping',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                  ],
                                ).expand(),


                              ],
                            ),
                            5.height,
                            Container(
                              color:state.data.port?.arrivalDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      //margin: const EdgeInsets.only(bottom: 40),
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.port?.arrivalDate != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.port?.arrivalDate != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),

                                10.width,


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.port?.arrivalDate ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Destination Port',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                  ],
                                ).expand(),

                              ],
                            ),
                            5.height,
                            Container(
                              color:state.data.warehouse?.arrivalDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      //margin: const EdgeInsets.only(bottom: 40),
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.warehouse?.arrivalDate != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.warehouse?.arrivalDate != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),
                                10.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.warehouse?.arrivalDate ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Warehouse',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                  ],
                                ).expand(),

                              ],
                            ),
                            5.height,

                            Container(
                              color:state.data.warehouse?.pickedDate != null ? kPrimaryColor : grey,
                              height: 60,
                              width: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                     // margin: const EdgeInsets.only(bottom: 40),
                                      decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: state.data.warehouse?.pickedDate  != null? kPrimaryColor : grey,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          state.data.warehouse?.pickedDate  != null? Icons.check_rounded : Icons.pending,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).expand(),
                                10.width,


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DxText(
                                      text: formatDateTime(state.data.warehouse?.pickedDate  ?? DateTime(0)),
                                    ),
                                    5.height,
                                    DxText(
                                      text: 'Delivered',
                                      color: kPrimaryColor,
                                      isBold: true,
                                    ),
                                  ],
                                ).expand(),


                              ],
                            ),







                          ],
                        ),
                      ) else Container(
                        height: 170,
                        decoration:
                        boxDecorationWithRoundedCorners(backgroundColor: lightGrey),
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.vehicle?.createdAt ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Shipping Created',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                  
                            Container(
                              color:state.data.towing?.towingDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.towing?.towingDate ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Towing',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.towing?.towingDate != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.towing?.towingDate != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                            Container(
                              color:state.data.towing?.warehouseDeliveryDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.towing?.warehouseDeliveryDate ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Warehouse CAD',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.towing?.warehouseDeliveryDate != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.towing?.warehouseDeliveryDate != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                            Container(
                              color:state.data.shipping?.shippingDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.shipping?.shippingDate ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Shipping',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.shipping?.shippingDate != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.shipping?.shippingDate != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                            Container(
                              color:state.data.port?.arrivalDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.port?.arrivalDate ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Destination Port',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.port?.arrivalDate != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.port?.arrivalDate != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                            Container(
                              color:state.data.warehouse?.arrivalDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.warehouse?.arrivalDate ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Warehouse',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.warehouse?.arrivalDate != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.warehouse?.arrivalDate != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                  
                            Container(
                              color:state.data.warehouse?.pickedDate != null ? kPrimaryColor : grey,
                              height: 2,
                            ).expand(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DxText(
                                  text: formatDateTime(state.data.warehouse?.pickedDate  ?? DateTime(0)),
                                ),
                                5.height,
                                DxText(
                                  text: 'Delivered',
                                  color: kPrimaryColor,
                                  isBold: true,
                                ),
                                5.height,
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 40),
                                  decoration: boxDecorationWithRoundedCorners(
                                    backgroundColor: state.data.warehouse?.pickedDate  != null? kPrimaryColor : grey,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      state.data.warehouse?.pickedDate  != null? Icons.check_rounded : Icons.pending,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
        
        
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {

      if(query.isNotEmpty){
        context.read<CustomerTrackingBloc>().add(
          TrackingCarEvent(
              params: TrackingParams(
                vinNumber: vinLotNumberController.text,
                lotNumber: vinLotNumberController.text,
              )),
        );
      }
    });
  }
}
