import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/features_admin/customer_profile/presentation/bloc/cutomer_profile_bloc.dart';
import 'package:hebauto/features_admin/pricelist/presentation/bloc/pricelist_bloc.dart';
import 'package:hebauto/features_admin/tracking/presentation/bloc/admin_tracking_bloc.dart';
import 'package:hebauto/features_billing/purchases/presentation/bloc/purchase_cubit.dart';
import 'package:hebauto/features_customer/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:hebauto/features_admin/admin_report/persentation/bloc/bloc/dropdown_bloc.dart';
import 'package:hebauto/features_admin/admin_report/persentation/bloc/fetch_report_bloc.dart';


import 'core/routing/app_route.dart';
import 'core/util/config.dart';



import 'features_admin/dashboard/presentation/bloc/add_customer_bloc/add_customer_bloc.dart';
import 'features_admin/inventory/presentation/bloc/inventory_bloc.dart';
import 'features_admin/signin/presentation/bloc/login_bloc.dart';


import 'features_billing/chartofaccounts/presentation/bloc/chat_of_accounts_cubit.dart';
import 'features_billing/dashboard/presentation/bloc/billing_dashboard_bloc.dart';
import 'features_customer/inventory/presentation/bloc/inventory_bloc.dart';
import 'features_customer/pricelist/presentation/bloc/pricelist_bloc.dart';
import 'features_customer/signin/presentation/bloc/login_bloc.dart';
import 'features_customer/tracking/presentation/bloc/customer_tracking_bloc.dart';

import 'injection.dart';

class AutoHeb extends StatelessWidget {
  const AutoHeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CustomerLoginBloc>()),
        BlocProvider(create: (_) => getIt<AdminLoginBloc>()),
        BlocProvider(create: (_) => getIt<AddCustomerBloc>()),
        //BlocProvider(create: (_) => getIt<FetchCustomerBloc>()),
        BlocProvider(create: (_) => getIt<CustomerInventoryBloc>()),
        BlocProvider(create: (_) => getIt<InventoryBloc>()),
        BlocProvider(create: (_) => getIt<CustomerTrackingBloc>()),
        BlocProvider(create: (_) => getIt<AdminTrackingBloc>()),
        BlocProvider(create: (_) => getIt<CustomerDashboardBloc>()),
        BlocProvider(create: (_) => getIt<PriceListBloc>()),
        BlocProvider(create: (_) => getIt<CustomerPriceListBloc>()),
        BlocProvider(create: (_) => getIt<CustomerProfileBloc>()),
        BlocProvider(create: (_) => getIt<FetchReportBloc>()),
        BlocProvider(create: (_) => getIt<DropdownBloc>()),
        BlocProvider(create: (_) => getIt<BillingDashboardBloc>()),

        ///
        BlocProvider(create: (_) => getIt<ChartOfAccountsCubit>()),
        BlocProvider(create: (_) => getIt<PurchasesCubit>())
      ],
      child: MaterialApp.router(

        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
        ),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        },



      ),
    );
  }
}
