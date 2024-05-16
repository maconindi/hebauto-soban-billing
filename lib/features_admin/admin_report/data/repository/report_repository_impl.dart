import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/admin_report/domain/usecases/filter_report_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/report_entitiy.dart';
import '../../domain/repository/report_repository.dart';
import '../datasources/report_datasource.dart';

@LazySingleton(as: ReportRepository)
class ReportRepositoryImpl extends ReportRepository {
  final ReportRemoteDataSourceImpl reportRemoteDataSourceImpl;
  ReportRepositoryImpl(this.reportRemoteDataSourceImpl);

  @override
  Future<Either<Failure, ReportEntity>> fetchReport({required int page}) async {
    final response = await reportRemoteDataSourceImpl.fetchReport(page: page);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        return Right(loginResponse);
      },
    );
  }

  @override
  Future<Either<Failure, ReportEntity>> filterReport(
      FilterReportParams reportParams) async {
    final response =
        await reportRemoteDataSourceImpl.filterReport(reportParams);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        return Right(loginResponse);
      },
    );
  }
}
