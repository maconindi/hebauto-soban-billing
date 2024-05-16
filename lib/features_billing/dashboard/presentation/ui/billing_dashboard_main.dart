import 'package:flutter/material.dart';
import 'package:hebauto/core/components/dx_text.dart';
import 'package:hebauto/core/util/colors.dart';

import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/util/decorations.dart';
import '../../../../generated/assets.dart';
import '../../../../injection.dart';
import '../../../purchases/domain/usecase/purchases_usecase.dart';
import '../widgets/hebauto_stats_widget.dart';
import '../widgets/inventory_summery_widget.dart';
import '../widgets/latest_invoices_widget.dart';
import '../widgets/sales_overview_widget.dart';

class BillingDashboardMain extends StatefulWidget {
  const BillingDashboardMain({super.key});

  @override
  State<BillingDashboardMain> createState() => _BillingDashboardMainState();
}

class _BillingDashboardMainState extends State<BillingDashboardMain> {
  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

  Future<void> initMain() async {


    debugPrint('>> res is >> ');



     final res = await getIt<PurchaseUseCase>().repository.fetchPurchaseItems();
     debugPrint('>> res is >> ${res.isRight()}');





  }

  @override
  void initState() {
    super.initState();

    initMain();




  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.height,



            kVerticalSpaces,

            /// Container Top 2
            ///
            ///
            Row(
              children: [
                Container(
                  height: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: kBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DxText(
                        text: 'Sale Overview',
                        size: 25,
                        isBold: true,
                      ),
                      10.height,
                      const SalesOverviewWidget()
                    ],
                  ),
                ).expand(flex: 2),
                10.width,
                Container(
                  height: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: kBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DxText(
                        text: 'Inventory Summary',
                        size: 25,
                        isBold: true,
                      ),
                      10.height,
                      const InventorySummeryWidget()
                    ],
                  ),
                ).expand(),
              ],
            ),

            kVerticalSpaces,

            /// Container Top 3
            ///
            ///
            Row(
              children: [
                Container(
                  height: 400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: kBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DxText(
                        text: 'Sale and Expenses',
                        size: 25,
                        isBold: true,
                      ),
                      10.height,
                      Expanded(
                        child: HebAutoStatsWidget(),
                      ),
                    ],
                  ),
                ).expand(flex: 4),
                10.width,
                Container(
                  height: 400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: kBackgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DxText(
                        text: 'Payment Summery',
                        size: 25,
                        isBold: true,
                      ),
                      10.height,
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child:
                                          DxImage(url: Assets.iconsCategories)),
                                  5.height,
                                  const DxText(
                                    text: '6947 AED',
                                    isBold: true,
                                    size: 15,
                                  ),
                                  5.width,
                                  const DxText(
                                    text: 'Overdue Invoices',
                                  ),
                                ],
                              ).expand(flex: 4),
                              Container(
                                child: Container(
                                  height: 30,
                                  width: 200,
                                  decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.circular(50),
                                      backgroundColor: redColor),
                                  child: const Center(
                                      child: Text(
                                    'New',
                                    style: TextStyle(color: white),
                                  )),
                                ),
                              ).expand()
                            ],
                          ),
                        ),
                      ).expand(),
                      Container(
                        width: context.width(),
                        color: grey.withOpacity(0.2),
                        height: 3,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  10.height,
                                  const SizedBox(
                                      height: 30,
                                      width: 30,
                                      child:
                                          DxImage(url: Assets.iconsSuppliers)),
                                  5.height,
                                  const DxText(
                                    text: '6947 AED',
                                    isBold: true,
                                    size: 15,
                                  ),
                                  5.width,
                                  const DxText(
                                    text: 'Upcoming Payments',
                                  ),
                                ],
                              ).expand(flex: 4),
                              Container(
                                child: Container(
                                  height: 30,
                                  width: 200,
                                  decoration: boxDecorationWithRoundedCorners(
                                      borderRadius: BorderRadius.circular(50),
                                      backgroundColor: Colors.blueAccent),
                                  child: const Center(
                                      child: Text(
                                    'New',
                                    style: TextStyle(color: white),
                                  )),
                                ),
                              ).expand()
                            ],
                          ),
                        ),
                      ).expand(),
                    ],
                  ),
                ).expand(),
              ],
            ),

            kVerticalSpaces,

            /// Container Top 3
            ///
            ///
            Container(
              height: 300,
              width: context.width(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: kBackgroundColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DxText(
                      text: 'Latest Invoices',
                      size: 25,
                      isBold: true,
                    ),
                    10.height,
                    const LatestInvoicesWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
