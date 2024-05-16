import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/services/hive/hive.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/injection.dart';

import '../../../../core/components/dx_empty_page.dart';
import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_slidebar_item.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../generated/assets.dart';
import '../../../inventory/presentation/pages/display_customer_inventory_screen.dart';
import '../../../pricelist/presentation/ui/price_list_screen.dart';
import '../../../tracking/presentation/ui/customer_tracking_screen.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_events.dart';
import '../pages/dashboard_main.dart';

class DashboardSideBarCustomer extends StatelessWidget {
  const DashboardSideBarCustomer({
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
                    // PageControllerProvider.of(context)
                    //     ?.pageController
                    //     .jumpToPage(0);

                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: DashboardMain(),
                        ),
                      ),
                    );
                  },
                ),
                SlideBarItem(
                  text: 'View Cars',
                  icon: Icons.track_changes_sharp,
                  onTap: () {
                    // PageControllerProvider.of(context)
                    //     ?.pageController
                    //     .jumpToPage(1);

                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: ShowCustomerInventory(),
                        ),
                      ),
                    );
                    //context.go('/customer/view-inventory');
                  },
                ),
                SlideBarItem(
                  text: 'Shipping Tracker',
                  icon: Icons.area_chart_outlined,
                  onTap: () {

                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: CustomerTrackingScreen(),
                        ),
                      ),
                    );
                    // PageControllerProvider.of(context)
                    //     ?.pageController
                    //     .jumpToPage(2);
                  },
                ),
                SlideBarItem(
                  text: 'Price List',
                  icon: Icons.money_outlined,
                  onTap: () {
                    // PageControllerProvider.of(context)
                    //     ?.pageController
                    //     .jumpToPage(3);
                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: PriceListScreen(),
                        ),
                      ),
                    );
                  },
                ),
                SlideBarItem(
                  text: 'Notifications',
                  icon: Icons.notifications_outlined,
                  onTap: () {
                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: EmptyPage(
                            pageName: 'Notification',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SlideBarItem(
                  text: 'Reports',
                  icon: Icons.content_paste,
                  onTap: () {
                    context.read<CustomerDashboardBloc>().add(
                      DashboardChangeScreenEvent(
                        const Center(
                          child: EmptyPage(
                            pageName: 'Reports',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // SlideBarItem(
                //   text: 'Estimate Calculator',
                //   icon: Icons.calculate_outlined,
                //   onTap: () {
                //     PageControllerProvider.of(context)
                //         ?.pageController
                //         .jumpToPage(5);
                //   },
                // ),

                // SlideBarItem(
                //   text: 'Chat',
                //   icon: Icons.chat_outlined,
                //   onTap: () {
                //     PageControllerProvider.of(context)
                //         ?.pageController
                //         .jumpToPage(7);
                //   },
                // ),

                SlideBarItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                   getIt<MainBoxMixin>().logoutBox().then((value) => {
                     context.go(Routes.customerLogin.path),
                     context.read<CustomerDashboardBloc>().add(DashboardResetEvent())

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
