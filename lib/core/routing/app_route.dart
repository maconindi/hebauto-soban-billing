import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features_admin/dashboard/presentation/pages/dashboard_screen.dart';
import '../../features_admin/signin/presentation/pages/signin_screen.dart';
import '../../features_billing/dashboard/presentation/ui/billing_dashboard_screen.dart';
import '../../features_customer/dashboard/presentation/pages/customer_dashboard_screen.dart';
import '../../features_customer/inventory/presentation/pages/display_customer_inventory_screen.dart';
import '../../features_customer/signin/presentation/pages/signin_screen_customer.dart';
import '../components/dx_error_page.dart';
import '../services/hive/main_box.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

enum Routes {
  root('/'),
  splashScreen('/splashscreen'),
  errorScreen('/not-found'),

  /// Home Page
  dashboard('/dashboard'),
  dashboardCustomer('/customer/dashboard'),
  adminBillingDashboard('/billing/dashboard'),

  // Update Inventory Screen
  // updateInventory('/admin/update-inventory'),

  // Auth Page
  login('/auth/login'),
  customerLogin('/customer/login'),
  customerViewInventory('customer/view-inventory'),
  register('/auth/register');

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.customerLogin.path,
        name: Routes.customerLogin.name,
        builder: (_, __) => LoginScreenCustomer(),
      ),

      GoRoute(
        path: Routes.errorScreen.path,
        name: Routes.errorScreen.name,
        builder: (_, __) => ErrorPage(),
      ),
      GoRoute(
        path: Routes.dashboard.path,
        name: Routes.dashboard.name,
        builder: (_, __) => const DashboardScreen(),
      ),
  GoRoute(
        path: Routes.adminBillingDashboard.path,
        name: Routes.adminBillingDashboard.name,
        builder: (_, __) => const BillingDashboardScreen(),
      ),

      //StatefulShellRoute.indexedStack(branches: []),

      GoRoute(
        path: Routes.dashboardCustomer.path,
        name: Routes.dashboardCustomer.name,
        builder: (_, __) {
          return const CustomerDashboardScreen();
        },
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return const CustomerDashboardScreen();
            },
            routes: [
              GoRoute(
                path: 'dashboard',
                builder: (BuildContext context, GoRouterState state) {
                  return const ShowCustomerInventory();
                },
              ),
              GoRoute(
                path: 'view-inventory',
                name: 'view-inventory',
                builder: (BuildContext context, GoRouterState state) {
                  return const ShowCustomerInventory();
                },
              ),
            ],
          )
        ],
      ),

      // GoRoute(
      //   path: Routes.updateInventory.path,
      //   name: Routes.updateInventory.name,
      //   builder: (_, __) => const UpdateInventoryScreen(),
      // ),
    ],
    initialLocation: Routes.customerLogin.path,
    routerNeglect: true,
    errorBuilder: (ctx, stx){

      return ErrorPage();
    },
    debugLogDiagnostics: kDebugMode,
    redirect: (_, GoRouterState state) {

      final isBillingDashboard = state.matchedLocation == Routes.adminBillingDashboard.path;

      bool isLoginRoute = (state.matchedLocation == Routes.customerLogin.path) || (state.matchedLocation == Routes.login.path);

      final bool isLoggedIn =
          (MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) ?? false);
      final bool isAdmin =
          (MainBoxMixin.mainBox?.get(MainBoxKeys.isAdmin.name) ?? false);

      if (isLoggedIn) {
        if (isAdmin) {
          if(isBillingDashboard) {
            return Routes.adminBillingDashboard.path;
          }
          return Routes.dashboard.path;
        } else {
          return Routes.dashboardCustomer.path;
        }
      }else if(isLoginRoute){
        return state.matchedLocation;
      }
      return Routes.errorScreen.path;
      // }else{
      //   return state.matchedLocation;
      // }

      // return state.matchedLocation;
      // final bool isLoginPage = state.matchedLocation == Routes.login.path;
      // final bool isAdmin = state.matchedLocation == Routes.login.path;
      //
      //
      // ///  Check if not login
      // ///  if current page is login page we don't need to direct user
      // ///  but if not we must direct user to login page
      // if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
      //     false)) {
      //   return isLoginPage ? null : Routes.login.path;
      // }
      //
      // /// Check if already login and in login page
      // /// we should direct user to main page
      //
      // if (isLoginPage &&
      //     ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
      //         false)) {
      //   return Routes.dashboardCustomer.path;
      // }
      //
      // /// No direct
      // return null;
    },
  );
}
