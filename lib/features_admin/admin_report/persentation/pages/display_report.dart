

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hebauto/core/components/dx_text.dart';

import 'package:hebauto/core/util/ext/ext.dart';
//import 'package:hebauto/features_admin/admin_report/domain/entities/report_entitiy.dart';
import 'package:hebauto/features_admin/admin_report/domain/usecases/filter_report_usecase.dart';
import 'package:hebauto/features_admin/admin_report/persentation/bloc/fetch_report_bloc.dart';
import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import 'package:intl/intl.dart';

import 'package:number_pagination/number_pagination.dart';

import '../../../../core/components/dx_dropdown_with_borders.dart';
import '../../../../core/components/dx_report_table.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/constants.dart';
import '../../../customer_profile/presentation/bloc/customer_profile_event.dart';
import '../../../customer_profile/presentation/bloc/cutomer_profile_bloc.dart';
import '../bloc/fetch_report_state.dart';

import 'exel_pdf_report.dart';

class DisplayReportScreen extends StatefulWidget {
  static const String displayReportScreen = 'displayInventoryScreen';
  const DisplayReportScreen({super.key});

  @override
  State<DisplayReportScreen> createState() => _DisplayReportScreenState();
}

class _DisplayReportScreenState extends State<DisplayReportScreen> {
  //late InventoryDataGrid _inventoryDataGrid;
  late String _cusName = '';
  late String _paymentStatus = '';
  late String _carStatus = '';
  TextEditingController _startDateTextController = TextEditingController();
  TextEditingController _endDateTextController = TextEditingController();
  DateFormat _inputFormat = DateFormat('dd-MM-yyyy');
  @override
  void initState() {
    super.initState();

    //context.read<InventoryBloc>().add(FetchInventoryEvent());
    context.read<FetchReportBloc>().add(
        FetchReport(page: 1, screen: DisplayReportScreen.displayReportScreen));

    context
        .read<CustomerProfileBloc>()
        .add(FetchCustomersEvent(page: 1, screen: ''));

    //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());

    // Call the method to fetch data when the screen is first initialized
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Call the method to fetch data every time the route changes
    if (ModalRoute.of(context)?.isCurrent == true) {}
  }

  @override
  Widget build(BuildContext context) {
   // final ReportItemEntity list;

    return SizedBox(
      height: context.height(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  Container(
                      width: 35, // Width of the circular card
                      height: 35, // Height of the circular card
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Shape of the container
                        color: Colors.white, // Color of the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/icons/car.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const DxText(
                    text: 'Shipped Cars',
                    isBold: true,
                    size: 18,
                    color: black,
                  ),
                ],
              )),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
              ),
              defaultWidgetsVerticalSpacing,
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/sort.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Fitter',
                      style: TextStyle(color: Color.fromARGB(255, 249, 28, 12)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text('Car Status'),
                  defaultWidgetsVerticalSpacing,
                  DxDropdownBordered(
                    height: 30,
                    width: 150,
                    hint: '....Select....',
                    onTap: (selection) {
                      _carStatus = selection;
                    },
                    items: const ['All', 'Delivered', 'Held'],
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text('Payment Status'),
                  defaultWidgetsVerticalSpacing,
                  DxDropdownBordered(
                    height: 30,
                    width: 150,
                    hint: '....Select....',
                    onTap: (selection) {
                      _paymentStatus = selection;
                    },
                    items: const ['All', 'Paid', 'Unpaid'],
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text('Customer Name'),
                  defaultWidgetsVerticalSpacing,
                  BlocBuilder<FetchReportBloc, ReportState>(
                      builder: (context, state) {
                    if (state.status.isLoading) {
                      return const Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                      );
                    } else if (state.status.isError) {
                      return Text(state.message);
                    } else if (state.status.isSuccess) {
                      ;
                      var listFinal = state.data.map((e) => e.cusName).toList();
                      listFinal.insert(0, 'All Customers');
                      return DxDropdownBordered(
                        height: 30,
                        width: 150,
                        hint: '....Select....',
                        onTap: (selection) {
                          _cusName = selection;
                        },
                        items: listFinal,
                      );
                    }
                    var listFinal = state.data.map((e) => e.cusName).toList();
                    listFinal.insert(0, 'All Customers');
                    return DxDropdownBordered(
                      height: 30,
                      width: 150,
                      hint: '....Select....',
                      onTap: (selection) {
                        _cusName = selection;
                      },
                      items: listFinal,
                    );
                  })
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text('Start Date'),
                  defaultWidgetsVerticalSpacing,
                  Center(
                    child: Container(
                      height: 30,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // Grey background color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        border: Border.all(color: Colors.grey), // Grey border
                      ),
                      child: TextField(
                        controller: _startDateTextController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 11),
                          hintText: 'dd-MM-yyyy',
                          border: InputBorder.none, // Hide default border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  const Text('End Date'),
                  defaultWidgetsVerticalSpacing,
                  Center(
                    child: Container(
                      height: 30,
                      width: 150,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        // Grey background color
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        border: Border.all(color: Colors.grey), // Grey border
                      ),
                      child: TextField(
                        controller: _endDateTextController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 11),
                          hintText: 'dd-MM-yyyy',
                          border: InputBorder.none, // Hide default border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: BlocBuilder<FetchReportBloc, ReportState>(
                      builder: (context, state) {
                    if (state.status.isLoading) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_carStatus == 'All') {
                            _carStatus = ' ';
                          }
                          if (_paymentStatus == 'All') {
                            _paymentStatus = ' ';
                          }
                          if (_cusName == 'All Customers') {
                            _cusName = ' ';
                          }
                          context.read<FetchReportBloc>().add(
                                FilterReport(
                                    params: FilterReportParams(
                                      carStatus: _carStatus,
                                      customerName: _cusName,
                                      endDate: _endDateTextController.value.text
                                              .trim()
                                              .isNotEmpty
                                          ? parseDate(_endDateTextController
                                                  .value.text
                                                  .trim())
                                              .toString()
                                          : _endDateTextController.value.text
                                              .trim(),
                                      paymentStatus: _paymentStatus,
                                      startDate: _startDateTextController
                                              .value.text
                                              .trim()
                                              .isNotEmpty
                                          ? parseDate(_startDateTextController
                                                  .value.text
                                                  .trim())
                                              .toString()
                                          : _startDateTextController.value.text
                                              .trim(),
                                    ),
                                    screen: DisplayReportScreen
                                        .displayReportScreen),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 250, 62, 48), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                        child: const Text('Submit'), // Button text
                      );
                    } else if (state.status.isError) {
                      return Text(state.message);
                    } else if (state.status.isSuccess) {
                      ;
                      return ElevatedButton(
                        onPressed: () {
                          if (_carStatus == 'All') {
                            _carStatus = ' ';
                          }
                          if (_paymentStatus == 'All') {
                            _paymentStatus = ' ';
                          }
                          if (_cusName == 'All Customers') {
                            _cusName = ' ';
                          }

                          context.read<FetchReportBloc>().add(
                                FilterReport(
                                    params: FilterReportParams(
                                      carStatus: _carStatus,
                                      customerName: _cusName,
                                      endDate: _endDateTextController.value.text
                                              .trim()
                                              .isNotEmpty
                                          ? parseDate(_endDateTextController
                                                  .value.text
                                                  .trim())
                                              .toString()
                                          : _endDateTextController.value.text
                                              .trim(),
                                      paymentStatus: _paymentStatus,
                                      startDate: _startDateTextController
                                              .value.text
                                              .trim()
                                              .isNotEmpty
                                          ? parseDate(_startDateTextController
                                                  .value.text
                                                  .trim())
                                              .toString()
                                          : _startDateTextController.value.text
                                              .trim(),
                                    ),
                                    screen: DisplayReportScreen
                                        .displayReportScreen),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color.fromARGB(
                              255, 250, 62, 48), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                        ),
                        child: const Text('Submit'), // Button text
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        context.read<FetchReportBloc>().add(
                              FilterReport(
                                  params: const FilterReportParams(
                                    carStatus: ' ',
                                    customerName: '',
                                    endDate: ' ',
                                    paymentStatus: ' ',
                                    startDate: ' ',
                                  ),
                                  screen:
                                      DisplayReportScreen.displayReportScreen),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                            255, 250, 62, 48), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                        ),
                      ),
                      child: const Text('Submit'), // Button text
                    );
                  }))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 240, 252),
                      borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 45,
                  // Main container color
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          height: 40,
                          width: 30,
                          // Sub-container color
                          child: BlocBuilder<FetchReportBloc, ReportState>(
                              builder: (context, state) {
                            return GestureDetector(
                              onTap: () async {
                                //List<List<dynamic>> listb = generateDummyList();
                                // print(
                                //  state.data.map((e) => e.vehicle.).toList());
                                exportAReportToExcel(
                                  state.data
                                      .map((e) => DateFormat('dd-MM-yyyy')
                                          .format(e.vehicle!.createdAt!))
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '${e.cusCompany}   / ${e.cusName}')
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '${e.vehicle?.name}   / ${e.vehicle?.vinNumber}  / ${e.vehicle?.lotNumber} ')
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '${e.invoice?.invoiceNumber}   / (CAD) ${e.invoice?.invoiceAmountCad}')
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '(CAD) ${e.invoice?.hstAmountCad}   /  (AED) ${e.port?.customCostAed} /  (CAD) ${e.shipping?.shippingCostCad}')
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '(CAD) ${e.towing?.towingCostCad}   / (CAD) ${e.warehouse?.storageCost}')
                                      .toList(),
                                  state.data
                                      .map((e) =>
                                          '(CAD) ${e.shipping?.shippingCostCad}')
                                      .toList(),
                                );
                              },
                              child: Image.asset(
                                'assets/images/icons/excel.png', // Replace 'assets/images/icons/excel.png' with your image path
                                height: 15,
                                width: 15,
                              ),
                            );
                          })),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        height: 40,
                        width: 30,
                        // Sub-container color
                        child: Image.asset(
                          height: 15, width: 15,
                          'assets/images/icons/pdf.png', // Replace 'assets/image.jpg' with your image path
                        ),
                      ),
                    ],
                  ))),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          BlocBuilder<FetchReportBloc, ReportState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else if (state.status.isError) {
                return Text(state.message);
              } else if (state.status.isSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DxReportTable(list: state.data),
                      defaultWidgetsVerticalSpacing,
                      defaultWidgetsVerticalSpacing,
                      NumberPagination(
                        onPageChanged: (int pageNumber) {},
                        threshold: 2,
                        pageTotal: state.lastPage,
                        pageInit: state.currentPage,
                        iconNext: IconButton(
                          onPressed: () {
                            //log('current page ${state.currentPage}');

                            if (state.lastPage != state.currentPage) {
                              context.read<FetchReportBloc>().add(FetchReport(
                                  page: state.currentPage + 1,
                                  screen:
                                      DisplayReportScreen.displayReportScreen));
                            }
                          },
                          icon: const Icon(Icons.navigate_next),
                        ),
                        iconPrevious: IconButton(
                          onPressed: () {
                            if (1 != state.currentPage) {
                              context.read<FetchReportBloc>().add(FetchReport(
                                  page: state.currentPage - 1,
                                  screen:
                                      DisplayReportScreen.displayReportScreen));
                            }
                          },
                          icon: const Icon(Icons.navigate_before),
                        ),
                        iconToFirst: IconButton(
                          onPressed: () {
                            context.read<FetchReportBloc>().add(FetchReport(
                                page: 1,
                                screen:
                                    DisplayReportScreen.displayReportScreen));
                          },
                          icon: const Icon(Icons.skip_previous_outlined),
                        ),
                        iconToLast: IconButton(
                          onPressed: () {
                            context.read<FetchReportBloc>().add(FetchReport(
                                page: state.lastPage,
                                screen:
                                    DisplayReportScreen.displayReportScreen));
                          },
                          icon: const Icon(Icons.skip_next_outlined),
                        ),
                      )
                    ],
                  ),
                );

                // return SingleChildScrollView(
                //   child: DxInventoryTable(list: state.data),
                // );
              }
              return Text(state.message);
            },
          ).expand(),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
        ],
      ),
    );
  }

  DateTime? parseDate(String dateText) {
    DateTime? parsedDate;
    try {
      parsedDate = _inputFormat.parse(dateText);
    } catch (e) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Date'),
          content: const Text('Please enter date in dd-MM-yyyy format.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return parsedDate;
  }
}
