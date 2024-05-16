import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/admin_report/domain/usecases/filter_report_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/paginated_model.dart';
import '../../../../core/network/api/api.dart';
import '../../domain/entities/report_entitiy.dart';
import '../models/report_model.dart';

abstract class ReportRemoteDataSource {
  Future<Either<Failure, ReportEntity>> fetchReport({required int page});
  Future<Either<Failure, ReportEntity>> filterReport(
      FilterReportParams filterReportParams);
}

@injectable
class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final DioClient _client;

  ReportRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, ReportEntity>> fetchReport({required int page}) async {
    final response = await _client.getRequest(
      ListAPI.fetchReport,
      queryParameters: {'page': page},
      isIsolate: false,
      converter: (response) {
        final res = PaginatedModel.fromJson(response, entityName: 'items').data;
        final items =
            res.dataList.map((e) => ReportItemModel.fromJson(e)).toList();

        return ReportModel(
            item: items,
            status: true,
            message: 'Operation Successful',
            prePageUrl: res.prevPageUrl,
            nextPageUrl: res.nextPageUrl,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            lastPage: res.lastPage,
            currentPage: res.currentPage);
      },
    );
    return response;
  }

  //----------Filter Report data---------------------------
  @override
  Future<Either<Failure, ReportEntity>> filterReport(
      FilterReportParams filterReportParams) async {
    final response = await _client.postRequest(
      ListAPI.filterReport,
      data: filterReportParams.toJson(),
      isIsolate: false,
      converter: (response) {
        final res = PaginatedModel.fromJson(response,entityName: 'items').data;
        final items =
            res.dataList.map((e) => ReportItemModel.fromJson(e)).toList();

        return ReportModel(
            item: items,
            status: true,
            message: 'Operation Successful',
            prePageUrl: res.prevPageUrl,
            nextPageUrl: res.nextPageUrl,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            lastPage: res.lastPage,
            currentPage: res.currentPage);
      },
    );

    return response;
  }
}
