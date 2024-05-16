// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/api/api.dart' as _i18;
import 'core/network/api/dio_client.dart' as _i4;
import 'core/services/hive/main_box.dart' as _i12;
import 'features_admin/admin_report/data/datasources/report_datasource.dart'
    as _i23;
import 'features_admin/admin_report/data/repository/report_repository_impl.dart'
    as _i25;
import 'features_admin/admin_report/domain/repository/report_repository.dart'
    as _i24;
import 'features_admin/admin_report/domain/usecases/filter_report_usecase.dart'
    as _i57;
import 'features_admin/admin_report/domain/usecases/report_usecase.dart'
    as _i26;
import 'features_admin/admin_report/persentation/bloc/bloc/dropdown_bloc.dart'
    as _i5;
import 'features_admin/admin_report/persentation/bloc/fetch_report_bloc.dart'
    as _i78;
import 'features_admin/customer_profile/data/datasource/customer_profile_datasource.dart'
    as _i48;
import 'features_admin/customer_profile/data/repository/customer_profile_repository_impl.dart'
    as _i50;
import 'features_admin/customer_profile/domain/repository/customer_profile_repository.dart'
    as _i49;
import 'features_admin/customer_profile/domain/usecase/customer_profile_usecase.dart'
    as _i51;
import 'features_admin/customer_profile/presentation/bloc/cutomer_profile_bloc.dart'
    as _i76;
import 'features_admin/dashboard/data/datasources/dashboard_remote_datasource.dart'
    as _i52;
import 'features_admin/dashboard/data/repository/dashboard_repository_impl.dart'
    as _i54;
import 'features_admin/dashboard/domain/repository/dashboard_repository.dart'
    as _i53;
import 'features_admin/dashboard/domain/usecases/add_customer_usecase.dart'
    as _i68;
import 'features_admin/dashboard/domain/usecases/fetch_customers_usecase.dart'
    as _i56;
import 'features_admin/dashboard/presentation/bloc/add_customer_bloc/add_customer_bloc.dart'
    as _i79;
import 'features_admin/inventory/data/datasource/inventory_datasource.dart'
    as _i6;
import 'features_admin/inventory/data/repository/inventory_repository_impl.dart'
    as _i8;
import 'features_admin/inventory/domain/repository/inventory_repository.dart'
    as _i7;
import 'features_admin/inventory/domain/usecases/inventory_usecase.dart' as _i9;
import 'features_admin/inventory/presentation/bloc/inventory_bloc.dart' as _i58;
import 'features_admin/pricelist/data/datasource/pricelist_datasource.dart'
    as _i13;
import 'features_admin/pricelist/data/repository/pricelist_repository.dart'
    as _i15;
import 'features_admin/pricelist/domain/repository/pricelist_repository.dart'
    as _i14;
import 'features_admin/pricelist/domain/usecase/pricelist_usecase.dart' as _i16;
import 'features_admin/pricelist/presentation/bloc/pricelist_bloc.dart' as _i65;
import 'features_admin/signin/data/datasources/login_remote_datasource.dart'
    as _i10;
import 'features_admin/signin/data/repositories/login_repository_impl.dart'
    as _i60;
import 'features_admin/signin/domain/repositories/login_repository.dart'
    as _i59;
import 'features_admin/signin/domain/usecases/login_usecase.dart' as _i63;
import 'features_admin/signin/presentation/bloc/login_bloc.dart' as _i69;
import 'features_admin/tracking/data/datasource/tracking_datesource.dart'
    as _i28;
import 'features_admin/tracking/data/repository/tracking_repository_impl.dart'
    as _i32;
import 'features_admin/tracking/domain/repository/tracking_repository.dart'
    as _i31;
import 'features_admin/tracking/domain/usecase/track_inventory_usecase.dart'
    as _i66;
import 'features_admin/tracking/presentation/bloc/admin_tracking_bloc.dart'
    as _i70;
import 'features_billing/chartofaccounts/data/datasource/chart_of_accounts_datasource.dart'
    as _i33;
import 'features_billing/chartofaccounts/data/repository/chart_of_accounts_impl.dart'
    as _i35;
import 'features_billing/chartofaccounts/domain/repository/chart_of_accounts_repository.dart'
    as _i34;
import 'features_billing/chartofaccounts/domain/usecase/chart_of_accounts_usecase.dart'
    as _i36;
import 'features_billing/chartofaccounts/presentation/bloc/chat_of_accounts_cubit.dart'
    as _i71;
import 'features_billing/dashboard/presentation/bloc/billing_dashboard_bloc.dart'
    as _i3;
import 'features_billing/purchases/data/datasource/purchase_datasource.dart'
    as _i17;
import 'features_billing/purchases/data/repository/purchase_repository_impl.dart'
    as _i20;
import 'features_billing/purchases/domain/repository/purchase_repository.dart'
    as _i19;
import 'features_billing/purchases/domain/usecase/purchases_usecase.dart'
    as _i21;
import 'features_billing/purchases/presentation/bloc/purchase_cubit.dart'
    as _i22;
import 'features_customer/dashboard/data/datasource/dashboard_datasource.dart'
    as _i37;
import 'features_customer/dashboard/data/repository/dashboard_repository_impl.dart'
    as _i39;
import 'features_customer/dashboard/domain/repository/dashboard_repository.dart'
    as _i38;
import 'features_customer/dashboard/domain/usecase/dashboard_stats_usecase.dart'
    as _i55;
import 'features_customer/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i72;
import 'features_customer/inventory/data/datasource/inventory_datasource.dart'
    as _i40;
import 'features_customer/inventory/data/repository/inventory_repository_impl.dart'
    as _i42;
import 'features_customer/inventory/domain/repository/inventory_repository.dart'
    as _i41;
import 'features_customer/inventory/domain/usecases/inventory_usecase.dart'
    as _i43;
import 'features_customer/inventory/presentation/bloc/inventory_bloc.dart'
    as _i73;
import 'features_customer/pricelist/data/datasource/customer_pricelist_datasource.dart'
    as _i44;
import 'features_customer/pricelist/data/repository/customer_pricelist_repository_impl.dart'
    as _i46;
import 'features_customer/pricelist/domain/repository/customer_pricelist_repository.dart'
    as _i45;
import 'features_customer/pricelist/domain/usecase/customer_pricelist_usecase.dart'
    as _i47;
import 'features_customer/pricelist/presentation/bloc/pricelist_bloc.dart'
    as _i75;
import 'features_customer/signin/data/datasources/login_remote_datasource.dart'
    as _i11;
import 'features_customer/signin/data/repositories/login_repository_impl.dart'
    as _i62;
import 'features_customer/signin/domain/repository/login_repository.dart'
    as _i61;
import 'features_customer/signin/domain/usecase/login_usecase.dart' as _i64;
import 'features_customer/signin/presentation/bloc/login_bloc.dart' as _i74;
import 'features_customer/tracking/data/datasource/tracking_datesource.dart'
    as _i27;
import 'features_customer/tracking/data/repository/tracking_repository_impl.dart'
    as _i30;
import 'features_customer/tracking/domain/repository/tracking_repository.dart'
    as _i29;
import 'features_customer/tracking/domain/usecase/track_inventory_usecase.dart'
    as _i67;
import 'features_customer/tracking/presentation/bloc/customer_tracking_bloc.dart'
    as _i77;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.BillingDashboardBloc>(() => _i3.BillingDashboardBloc());
  gh.singleton<_i4.DioClient>(() => _i4.DioClient());
  gh.factory<_i5.DropdownBloc>(() => _i5.DropdownBloc());
  gh.factory<_i6.InventoryRemoteDataSourceImpl>(
      () => _i6.InventoryRemoteDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i7.InventoryRepository>(() =>
      _i8.InventoryRepositoryImpl(gh<_i6.InventoryRemoteDataSourceImpl>()));
  gh.factory<_i9.InventoryUseCase>(
      () => _i9.InventoryUseCase(gh<_i7.InventoryRepository>()));
  gh.factory<_i10.LoginRemoteDataSource>(
      () => _i10.LoginRemoteDatasourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i11.LoginRemoteDataSource>(
      () => _i11.LoginRemoteDatasourceImpl(gh<_i4.DioClient>()));
  gh.singleton<_i12.MainBoxMixin>(() => _i12.MainBoxMixin());
  gh.factory<_i13.PriceListDataSource>(
      () => _i13.PriceListDateSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i14.PriceListRepository>(
      () => _i15.PriceListRepositoryImpl(gh<_i13.PriceListDataSource>()));
  gh.factory<_i16.PriceListUseCase>(
      () => _i16.PriceListUseCase(gh<_i14.PriceListRepository>()));
  gh.factory<_i17.PurchaseDatasource>(
      () => _i17.PurchaseDatasourceImpl(gh<_i18.DioClient>()));
  gh.factory<_i19.PurchaseRepository>(
      () => _i20.PurchaseRepositoryImpl(gh<_i17.PurchaseDatasource>()));
  gh.factory<_i21.PurchaseUseCase>(
      () => _i21.PurchaseUseCase(gh<_i19.PurchaseRepository>()));
  gh.factory<_i22.PurchasesCubit>(
      () => _i22.PurchasesCubit(gh<_i21.PurchaseUseCase>()));
  gh.factory<_i23.ReportRemoteDataSourceImpl>(
      () => _i23.ReportRemoteDataSourceImpl(gh<_i18.DioClient>()));
  gh.lazySingleton<_i24.ReportRepository>(
      () => _i25.ReportRepositoryImpl(gh<_i23.ReportRemoteDataSourceImpl>()));
  gh.lazySingleton<_i26.ReportUseCase>(
      () => _i26.ReportUseCase(gh<_i24.ReportRepository>()));
  gh.factory<_i27.TrackInventoryRemoteDataSourceImpl>(
      () => _i27.TrackInventoryRemoteDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i28.TrackInventoryRemoteDataSourceImpl>(
      () => _i28.TrackInventoryRemoteDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i29.TrackingInventoryRepository>(() =>
      _i30.TrackingInventoryRepositoryImpl(
          gh<_i27.TrackInventoryRemoteDataSourceImpl>()));
  gh.factory<_i31.TrackingInventoryRepository>(() =>
      _i32.TrackingInventoryRepositoryImpl(
          gh<_i28.TrackInventoryRemoteDataSourceImpl>()));
  gh.factory<_i33.ChartOfAccountsDatasource>(
      () => _i33.ChartOfAccountsDatasourceImpl(gh<_i18.DioClient>()));
  gh.factory<_i34.ChartOfAccountsRepository>(() =>
      _i35.ChartOfAccountsRepositoryImpl(gh<_i33.ChartOfAccountsDatasource>()));
  gh.factory<_i36.ChartOfAccountsUseCase>(
      () => _i36.ChartOfAccountsUseCase(gh<_i34.ChartOfAccountsRepository>()));
  gh.factory<_i37.CustomerDashboardDatasourceImpl>(
      () => _i37.CustomerDashboardDatasourceImpl(gh<_i18.DioClient>()));
  gh.factory<_i38.CustomerDashboardRepository>(() =>
      _i39.CustomerDashboardRepositoryImpl(
          gh<_i37.CustomerDashboardDatasourceImpl>()));
  gh.factory<_i40.CustomerInventoryRemoteDataSourceImpl>(
      () => _i40.CustomerInventoryRemoteDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i41.CustomerInventoryRepository>(() =>
      _i42.CustomerInventoryRepositoryImpl(
          gh<_i40.CustomerInventoryRemoteDataSourceImpl>()));
  gh.factory<_i43.CustomerInventoryUseCase>(() =>
      _i43.CustomerInventoryUseCase(gh<_i41.CustomerInventoryRepository>()));
  gh.factory<_i44.CustomerPriceListDataSource>(
      () => _i44.PriceListDateSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i45.CustomerPriceListRepository>(() =>
      _i46.CustomerPriceListRepositoryImpl(
          gh<_i44.CustomerPriceListDataSource>()));
  gh.factory<_i47.CustomerPriceListUseCase>(() =>
      _i47.CustomerPriceListUseCase(gh<_i45.CustomerPriceListRepository>()));
  gh.factory<_i48.CustomerProfileDataSource>(
      () => _i48.CustomerProfileDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i49.CustomerProfileRepository>(() =>
      _i50.CustomerProfileRepositoryImpl(gh<_i48.CustomerProfileDataSource>()));
  gh.factory<_i51.CustomerProfileUseCase>(
      () => _i51.CustomerProfileUseCase(gh<_i49.CustomerProfileRepository>()));
  gh.factory<_i52.DashboardRemoteDataSourceImpl>(
      () => _i52.DashboardRemoteDataSourceImpl(gh<_i4.DioClient>()));
  gh.factory<_i53.DashboardRepository>(() =>
      _i54.DashboardRepositoryImpl(gh<_i52.DashboardRemoteDataSourceImpl>()));
  gh.factory<_i55.DashboardStatsUseCase>(
      () => _i55.DashboardStatsUseCase(gh<_i38.CustomerDashboardRepository>()));
  gh.factory<_i56.FetchCustomersUseCase>(
      () => _i56.FetchCustomersUseCase(gh<_i53.DashboardRepository>()));
  gh.lazySingleton<_i57.FilterReportUseCase>(
      () => _i57.FilterReportUseCase(gh<_i24.ReportRepository>()));
  gh.factory<_i58.InventoryBloc>(
      () => _i58.InventoryBloc(gh<_i9.InventoryUseCase>()));
  gh.factory<_i59.LoginRepository>(() => _i60.LoginRepositoryImpl(
        gh<_i10.LoginRemoteDataSource>(),
        gh<_i12.MainBoxMixin>(),
      ));
  gh.factory<_i61.LoginRepositoryCustomer>(() => _i62.LoginRepositoryImpl(
        gh<_i11.LoginRemoteDataSource>(),
        gh<_i12.MainBoxMixin>(),
      ));
  gh.factory<_i63.LoginUseCase>(
      () => _i63.LoginUseCase(gh<_i59.LoginRepository>()));
  gh.factory<_i64.LoginUseCase>(
      () => _i64.LoginUseCase(gh<_i61.LoginRepositoryCustomer>()));
  gh.factory<_i65.PriceListBloc>(
      () => _i65.PriceListBloc(gh<_i16.PriceListUseCase>()));
  gh.factory<_i66.TrackInventoryUsecase>(
      () => _i66.TrackInventoryUsecase(gh<_i31.TrackingInventoryRepository>()));
  gh.factory<_i67.TrackInventoryUsecase>(
      () => _i67.TrackInventoryUsecase(gh<_i29.TrackingInventoryRepository>()));
  gh.factory<_i68.AddCustomerUseCase>(
      () => _i68.AddCustomerUseCase(gh<_i53.DashboardRepository>()));
  gh.factory<_i69.AdminLoginBloc>(
      () => _i69.AdminLoginBloc(gh<_i63.LoginUseCase>()));
  gh.factory<_i70.AdminTrackingBloc>(
      () => _i70.AdminTrackingBloc(gh<_i66.TrackInventoryUsecase>()));
  gh.factory<_i71.ChartOfAccountsCubit>(
      () => _i71.ChartOfAccountsCubit(gh<_i36.ChartOfAccountsUseCase>()));
  gh.factory<_i72.CustomerDashboardBloc>(
      () => _i72.CustomerDashboardBloc(gh<_i55.DashboardStatsUseCase>()));
  gh.factory<_i73.CustomerInventoryBloc>(
      () => _i73.CustomerInventoryBloc(gh<_i43.CustomerInventoryUseCase>()));
  gh.factory<_i74.CustomerLoginBloc>(
      () => _i74.CustomerLoginBloc(gh<_i64.LoginUseCase>()));
  gh.factory<_i75.CustomerPriceListBloc>(
      () => _i75.CustomerPriceListBloc(gh<_i47.CustomerPriceListUseCase>()));
  gh.factory<_i76.CustomerProfileBloc>(
      () => _i76.CustomerProfileBloc(gh<_i51.CustomerProfileUseCase>()));
  gh.factory<_i77.CustomerTrackingBloc>(
      () => _i77.CustomerTrackingBloc(gh<_i67.TrackInventoryUsecase>()));
  gh.factory<_i78.FetchReportBloc>(() => _i78.FetchReportBloc(
        gh<_i26.ReportUseCase>(),
        gh<_i57.FilterReportUseCase>(),
      ));
  gh.factory<_i79.AddCustomerBloc>(
      () => _i79.AddCustomerBloc(gh<_i68.AddCustomerUseCase>()));
  return getIt;
}
