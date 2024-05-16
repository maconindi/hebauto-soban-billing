import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/fd_textfield.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/decorations.dart';
import '../bloc/billing_dashboard_bloc.dart';
import '../bloc/billing_dashboard_states.dart';
import '../widgets/billing_customer_sidebar.dart';

class BillingDashboardScreen extends StatefulWidget {
  const BillingDashboardScreen({super.key});

  @override
  State<BillingDashboardScreen> createState() => _BillingDashboardScreenState();
}

class _BillingDashboardScreenState extends State<BillingDashboardScreen> {
  final kBackgroundColor = Colors.grey.withOpacity(0.1);
  final kVerticalSpaces = 10.height;
  final kHorizontalSpaces = 5.width;

  Future<void> initMain() async {
    // debugPrint('>> res is >> ');
    // final res = await getIt<PurchaseUseCase>().repository.fetchPurchaseItems();
    // debugPrint('>> res is >> ${res.isRight()}');
  }

  @override
  void initState() {
    super.initState();
    initMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (context.isPhone()) const SizedBox.shrink() else const DashboardSideBarBilling().expand(flex: 1),
          Column(
            children: [

              20.height,

              /// Container Top 1
              ///
              Container(
                width: context.width(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: kBackgroundColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: FDTextField(
                        textFieldType: TextFieldType.NAME,
                        controller: TextEditingController(),
                        suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_rounded,
                            color: grey,
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return 'Something is required!';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {},
                        decoration: defaultInputDecoration(
                          hint: 'Search vin, customer, invoice',
                          textStyle: const TextStyle(color: grey),
                        ),
                      ),
                    ).expand(flex: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.add_alert),
                        ),
                        10.width,
                        const CircleAvatar(
                          child: Icon(Icons.person),
                        )
                      ],
                    ).expand(flex: 4)
                  ],
                ),
              ),

              5.height,

              BlocBuilder<BillingDashboardBloc, BillingDashboardState>(
                builder: (context, state) {
                  return state.screen;
                },
              ).expand(),

            ],
          ).expand(flex: 5)
        ],
      ),
    );
}

}


