import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hebauto/core/services/hive/hive.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/features_billing/settingsaccounts/presentation/ui/setting_screen.dart';
import 'package:hebauto/injection.dart';

import '../../../../core/components/dx_image.dart';
import '../../../../core/components/dx_slidebar_item.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../generated/assets.dart';
import '../../../inventory/presentation/ui/inventory_screen.dart';
import '../../../purchases/presentation/ui/add_purchase_screen.dart';
import '../../../reports/presentation/ui/reports_screen.dart';
import '../bloc/billing_dashboard_bloc.dart';
import '../bloc/billing_dashboard_events.dart';
import '../ui/billing_dashboard_main.dart';

class DashboardSideBarBilling extends StatelessWidget {
  const DashboardSideBarBilling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const DxImage(
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
                    context.read<BillingDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: BillingDashboardMain(),
                            ),
                          ),
                        );
                  },
                ),
                SlideBarItem(
                  text: 'Sales Invoice',
                  icon: Icons.account_balance_rounded,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Inventory',
                  icon: Icons.inventory_2_outlined,
                  onTap: () {
                    context.read<BillingDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: BillingInventoryScreen(),
                            ),
                          ),
                        );
                  },
                ),
                SlideBarItem(
                  text: 'Credit Notes',
                  icon: Icons.notes,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Receipts',
                  icon: Icons.receipt_long_rounded,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Payments',
                  icon: Icons.payment_rounded,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Purchase',
                  icon: Icons.pending_actions_rounded,
                  onTap: () {
                    context.read<BillingDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: AddPurchaseScreen(),
                            ),
                          ),
                        );
                  },
                ),
                SlideBarItem(
                  text: 'Suppliers',
                  icon: Icons.support_agent,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Customers',
                  icon: Icons.supervised_user_circle_outlined,
                  onTap: () {},
                ),
                SlideBarItem(
                  text: 'Reports',
                  icon: Icons.file_present,
                  onTap: () {
                    context.read<BillingDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: ReportsScreen(),
                            ),
                          ),
                        );
                  },
                ),
                SlideBarItem(
                  text: 'Journal Entry',
                  icon: Icons.inventory_rounded,
                  onTap: () {},
                ),
                // SlideBarItem(
                //   text: 'Chart of Accounts',
                //   icon: Icons.account_tree_outlined,
                //   onTap: () {
                //     context.read<BillingDashboardBloc>().add(
                //           DashboardChangeScreenEvent(
                //             const Center(
                //               child: ChartOfAccountsScreen(),
                //             ),
                //           ),
                //         );
                //   },
                // ),
                30.height,
                SlideBarItem(
                  text: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    context.read<BillingDashboardBloc>().add(
                          DashboardChangeScreenEvent(
                            const Center(
                              child: SettingScreen(),
                            ),
                          ),
                        );
                  },
                ),
                SlideBarItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    getIt<MainBoxMixin>().logoutBox().then((value) => {
                          context.go(Routes.login.path),
                          //context.read<CustomerDashboardBloc>().add(DashboardResetEvent())
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
