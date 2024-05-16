import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/customer_profile_state.dart';
import 'package:hebauto/features_admin/pricelist/presentation/bloc/pricelist_state.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_pdf_viewer.dart';
import '../../../../core/components/fd_button.dart';
import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/util.dart';
import '../../../../generated/assets.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../../../customer_profile/presentation/bloc/cutomer_profile_bloc.dart';
import '../../../inventory/presentation/widget/select_customer.dart';
import '../../domain/usecase/pricelist_usecase.dart';
import '../bloc/pricelist_bloc.dart';
import '../bloc/pricelist_event.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  CustomerEntity? customerEntity;
  final pdfTextConttroller = TextEditingController();
  PlatformFile? fPdf;

  static const String addPriceListEvent = 'addPriceListEvent';
  static const String fetchPriceListEvent = 'fetchPriceListEvent';
  static const String deletePriceListEvent = 'deletePriceListEvent';
  static const String selectCustomerFirst = 'Select customer first!';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.height(),
          child: Column(
            children: [
              50.height,
              Container(
                decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: grey)),
                //height: 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    BlocBuilder<CustomerProfileBloc, CustomerProfileState>(
                      builder: (context, state) {
                        return SearchCustomerDropDown(
                          customers: state.data,
                          customerCallback: (value) {
                            context.read<PriceListBloc>().add(
                                  FetchPriceListEvent(
                                    screen: fetchPriceListEvent,
                                    params: PriceListParams(
                                        cusId: value.cusId,
                                        cusEmail: value.email),
                                  ),
                                );

                            customerEntity = value;

                            // context.read<FetchCustomerBloc>().state.customer = value;

                            // setState(() {
                            //   customerEntity = value;
                            // });
                            //context.read<FetchCustomerBloc>().;
                          },
                        );
                      },
                    ),
                    50.height,
                    Row(
                      children: [
                        SizedBox(
                          width: 300,
                          child: InkWell(
                            onTap: () async {
                              if (customerEntity != null) {
                                final res = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf']);

                                fPdf = res?.files.first;
                                pdfTextConttroller.text = fPdf?.name ?? '';
                              } else {
                                selectCustomerFirst.toast();
                              }
                            },
                            child: FDTextField(
                              showCursor: false,
                              enabled: false,
                              textFieldType: TextFieldType.NAME,
                              controller: pdfTextConttroller,
                              decoration: defaultInputDecoration(
                                  hint: 'Pick Pdf',
                                  textStyle: TextStyle(color: kPrimaryColor)),
                              suffix: const Icon(Icons.picture_as_pdf_outlined),
                            ),
                          ),
                        ),
                        const SizedBox().expand(),
                        BlocBuilder<PriceListBloc, PriceListState>(
                          builder: (context, state) {
                            //debugPrint('State of Add event ${state.view} ');
                            if (state.status.isLoading &&
                                state.view == addPriceListEvent) {
                              return const CircularProgressIndicator();
                            }
                            return FDButton(
                              text: 'Add Price List',
                              onTap: () {
                                if (customerEntity != null) {
                                  if (fPdf != null) {
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        context.read<PriceListBloc>().add(
                                              AddPriceListEvent(
                                                screen: addPriceListEvent,
                                                params: const PriceListParams(),
                                                file: fPdf ??
                                                    PlatformFile(
                                                        name: '', size: 0),
                                                customer: customerEntity ??
                                                    const CustomerEntity(),
                                              ),
                                            );
                                      },
                                    );
                                  }
                                } else {
                                  selectCustomerFirst.toast();
                                }
                              },
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              50.height,
              BlocBuilder<PriceListBloc, PriceListState>(
                builder: (context, state) {
                  //debugPrint('State of Fetch event ${state.view} ');
                  if (state.status.isError) {
                    return Text(state.message);
                  }
                  if (state.status.isLoading &&
                      state.view == fetchPriceListEvent) {
                    return const CircularProgressIndicator();
                  }
                  if (state.status.isSuccess) {
                    return state.data.isEmpty
                        ? const Center(
                            child: Text('No Pricelist Found!'),
                          )
                        : SizedBox(
                            width: context.width(),
                            height: 400,
                            child: SingleChildScrollView(
                              child
                                  : DataTable(
                                columns: const [

                                  DataColumn(
                                    label: Text(
                                      'Sr No.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Company Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'File',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      'Created Date',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],



                                rows: state.data.asMap().entries
                                    .map(
                                      (item) {
                                        final e = item.value;
                                        return DataRow(
                                          cells: [

                                            // DataCell(
                                            //   Text(item.key.toString()),
                                            // ),

                                            DataCell(
                                              Text((item.key+1).toString()),
                                            ),
                                            DataCell(
                                              Text(e.cusName),
                                            ),
                                            DataCell(
                                              Text(e.cusCompany),
                                            ),
                                            DataCell(
                                              IconButton(icon: const Icon(Icons.picture_as_pdf_outlined) , onPressed: (){
                                                if(e.url != ''){
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return DxPdfViewer(
                                                          vin: '',
                                                          url: e.url);
                                                    },
                                                  );
                                                }else{
                                                  'Something went wrong! Try again.'.toast();
                                                }
                                              },),
                                            ),
                                            DataCell(
                                              Text(
                                               '${e.createdAt ?? DateTime(0)}'
                                              ),
                                            ),
                                            DataCell(
                                              BlocBuilder<PriceListBloc,
                                                  PriceListState>(
                                                builder: (context, state) {
                                                  //debugPrint('State of Delete event ${state.view} ');
                                                  if (state.status.isLoading &&
                                                      state.view ==
                                                          deletePriceListEvent) {
                                                    return const CircularProgressIndicator();
                                                  }
                                                  return IconButton(
                                                      onPressed: () {
                                                        context
                                                            .read<PriceListBloc>()
                                                            .add(
                                                          DeletePriceListEvent(
                                                            screen:
                                                            deletePriceListEvent,
                                                            params:
                                                            const PriceListParams(),
                                                            url: e.url,
                                                            customer:
                                                            customerEntity ??
                                                                const CustomerEntity(),
                                                          ),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: redColor,
                                                      ));
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                    .toList(),

                                // rows:  [
                                //
                                //
                                //
                                //   DataRow(cells: [
                                //     DataCell(Text('1')),
                                //     DataCell(Icon(Icons.picture_as_pdf_outlined)),
                                //     DataCell(Text('ROGUE')),
                                //     DataCell(Text('12/11/2021')),
                                //     DataCell(Text(
                                //       'x',
                                //       style: TextStyle(color: Colors.red),
                                //     )),
                                //   ]),
                                //   DataRow(cells: [
                                //     DataCell(Text('5')),
                                //     DataCell(Icon(Icons.picture_as_pdf_outlined)),
                                //     DataCell(Text('SUZUKI')),
                                //     DataCell(Text('12/11/2021')),
                                //     DataCell(Text(
                                //       'x',
                                //       style: TextStyle(color: Colors.red),
                                //     )),
                                //   ]),
                                //   DataRow(cells: [
                                //     DataCell(Text('7')),
                                //     DataCell(Icon(Icons.picture_as_pdf_outlined)),
                                //     DataCell(Text('HONDA')),
                                //     DataCell(Text('12/11/2021')),
                                //     DataCell(Text(
                                //       'x',
                                //       style: TextStyle(color: Colors.red),
                                //     )),
                                //   ]),
                                //   DataRow(cells: [
                                //     DataCell(Text('8')),
                                //     DataCell(Icon(Icons.picture_as_pdf_outlined)),
                                //     DataCell(Text('SLEEK')),
                                //     DataCell(Text('12/11/2021')),
                                //     DataCell(Text(
                                //       'x',
                                //       style: TextStyle(color: Colors.red),
                                //     )),
                                //   ]),
                                // ],
                              ),
                            ),
                          );
                  }

                  if (state.status.isInitial) {
                    return const SizedBox.shrink();
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ).expand(flex: 3),
        SizedBox(
          height: context.height(),
          child: const Column(
            children: [
              DxImage(
                url: Assets.bannersPriceListingBanner,
                //     width: context.width(),
                // height: context.height(),
              )
            ],
          ),
        ).expand(flex: 2),
      ],
    );
  }
}
