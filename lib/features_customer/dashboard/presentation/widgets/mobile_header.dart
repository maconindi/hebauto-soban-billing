import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/util/decorations.dart';
import 'package:hebauto/core/util/ext/ext.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_text.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../generated/assets.dart';
import '../../../../injection.dart';
import '../../../inventory/presentation/pages/display_customer_inventory_screen.dart';
import '../../../tracking/presentation/ui/customer_tracking_screen.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_events.dart';
import '../pages/dashboard_main.dart';

class MobileHeader extends StatefulWidget {
  const MobileHeader({super.key});

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
  int segmentedControlGroupValue = 1;
  final Map<int, Widget> myTabs = const <int, Widget>{
    1: Text(
      'Dashboard',
    ),
    2: Text(
      'View Cars',
    ),
    3: Text(
      'Tracking',
    )
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration:
          boxDecorationWithRoundedCorners(backgroundColor: kPrimaryColor),
      width: context.width(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //color: kPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DxText(
                text: 'Welcome back!',
                size: 15,
                color: white,
                align: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    getIt<MainBoxMixin>().logoutBox().then((value) => {
                          context.go(Routes.customerLogin.path),
                          context
                              .read<CustomerDashboardBloc>()
                              .add(DashboardResetEvent())
                        });
                  },
                  icon: const Icon(
                    Icons.power_settings_new_rounded,
                    color: white,
                  ))
            ],
          ),
          20.height,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DxText(
                    text: '${MainBoxMixin.mainBox?.get(MainBoxKeys.name.name)}'
                        .toUpperCase(),
                    size: 15,
                    color: white,
                  ),
                  DxText(
                    text: '${MainBoxMixin.mainBox?.get(MainBoxKeys.email.name)}'
                        .toLowerCase(),
                    size: 15,
                    color: white,
                  ),
                ],
              ),
              10.width,
              SizedBox(
                height: 50,
                child: DxImage(
                  url: Assets.imagesLogoWhite,
                  fit: BoxFit.fill,
                  // height: context.height(),
                ),
              ).expand()
            ],
          ),
          10.height,
          SizedBox(
            width: context.width(),
            child: CupertinoSlidingSegmentedControl(
              backgroundColor: white,
              thumbColor: kPrimaryColor,
              groupValue: segmentedControlGroupValue,
              onValueChanged: (value) {
                switch (value) {
                  case 1:
                    context.read<CustomerDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: DashboardMain(),
                            ),
                          ),
                        );

                    break;
                  case 2:
                    context.read<CustomerDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: ShowCustomerInventory(),
                            ),
                          ),
                        );
                    break;
                  case 3:
                    context.read<CustomerDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: CustomerTrackingScreen(),
                            ),
                          ),
                        );
                    break;
                }

                setState(() {
                  segmentedControlGroupValue = value ?? 0;
                });
              },
              children: myTabs,
              // groupValue: segmentedControlGroupValue,
              // children: myTabs,
              // onValueChanged: (i) {
              //   setState(() {
              //     segmentedControlGroupValue = i;
              //   });
              // }
            ),
          ),
        ],
      ),
    );
  }
}
