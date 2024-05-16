import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/admin_report/domain/usecases/filter_report_usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/report_entitiy.dart';

abstract class ReportRepository {
  // this to fetch all the of the report data form the database
  Future<Either<Failure, ReportEntity>> fetchReport({required int page});
  // this to filter the reported data ase on the below keys
  Future<Either<Failure, ReportEntity>> filterReport(
      FilterReportParams reportParams);
}
