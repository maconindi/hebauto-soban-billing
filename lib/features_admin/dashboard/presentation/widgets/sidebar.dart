import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/util/ext/int.dart';
import 'package:hebauto/core/util/ext/widget.dart';
import 'package:hebauto/features_admin/dashboard/presentation/widgets/page_controller_provider.dart';
import 'package:hebauto/features_admin/pricelist/presentation/bloc/pricelist_event.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_slidebar_item.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../../../generated/assets.dart';
import '../../../../injection.dart';
import '../../../pricelist/presentation/bloc/pricelist_bloc.dart';

class DashboardSideBar extends StatelessWidget {
  const DashboardSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          DxImage(
            url: Assets.imagesLogo,
            // width: context.width(),
            // height: context.height(),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                20.height,
                const Divider(),
                20.height,
                SlideBarItem(
                  text: 'Dashboard',
                  icon: Icons.computer,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(0);
                  },
                ),
                SlideBarItem(
                  text: 'Add Cars',
                  icon: Icons.car_crash_sharp,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(1);
                  },
                ),
                SlideBarItem(
                  text: 'View Cars',
                  icon: Icons.track_changes_sharp,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(2);
                    // controller.animateTo( 2 , duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  },
                ),
                SlideBarItem(
                  text: 'Progress Tracker',
                  icon: Icons.area_chart_outlined,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(3);
                    // controller.animateTo( 3 , duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  },
                ),
                SlideBarItem(
                  text: 'Update Price List',
                  icon: Icons.money_outlined,
                  onTap: () {

                    context.read<PriceListBloc>().add(
                      ResetPriceListEvent()
                    );
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(4);
                    //  controller.animateTo( 4 , duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
                  },
                ),
                SlideBarItem(
                  text: 'Notifications',
                  icon: Icons.notifications_outlined,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(5);
                  },
                ),
                SlideBarItem(
                  text: 'Estimate Calculator',
                  icon: Icons.calculate_outlined,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(6);
                  },
                ),
                SlideBarItem(
                  text: 'Create Customer Account',
                  icon: Icons.man_4,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(7);
                  },
                ),
                SlideBarItem(
                  text: 'Customers',
                  icon: Icons.people_alt_outlined,
                  onTap: () {
                    //context.read<FetchCustomerBloc>().add(FetchCustomersEvent());
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(8);
                  },
                ),
                SlideBarItem(
                  text: 'Reports',
                  icon: Icons.content_paste,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(9);
                  },
                ),
                SlideBarItem(
                  text: 'Chat',
                  icon: Icons.chat_outlined,
                  onTap: () {
                    PageControllerProvider.of(context)
                        ?.pageController
                        .jumpToPage(10);
                  },
                ),
                SlideBarItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    getIt<MainBoxMixin>().logoutBox().then((value) => {
                      context.go(Routes.login.path)

                    });
                  },
                ),
              ],
            ),
          ).expand(),
        ],
      ),
    );
  }
}
