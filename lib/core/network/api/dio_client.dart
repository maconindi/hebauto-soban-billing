

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../features_admin/inventory/domain/usecases/inventory_usecase.dart';
import '../../error/failure.dart';
import '../../models/file_upload_response_model.dart';
import '../../services/hive/main_box.dart';
import 'dio_interceptor.dart';
import 'isolate_parser.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

@singleton
class DioClient {
  DioClient() {
    _isUnitTest = true;

    _dio = _createDio();
     /// Comment before pushing to the Server
     //_dio.interceptors.add(DioInterceptor());
  }

  /// TEST
  final String baseUrl = 'http://127.0.0.1:8000/';

  /// PROD
  //final String baseUrl = 'https://api.hebautogroup.com/';

  String? _auth;
  bool _isUnitTest = true;
  late Dio _dio;

  Dio get dio {
    if (_isUnitTest) {
      return _dio;
    } else {
      final dio = _createDio();
      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());
      return dio;
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Access-Control-Allow-Origin': '*',
            if (_auth != null) ...{
              'Authorization': _auth,
            } else ...{
              'Authorization':
                  'Bearer ${MainBoxMixin.mainBox?.get(MainBoxKeys.token.name)}',
            },
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
    bool isIsolate = kIsWeb ? false : true,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);

      //debugPrint('${response.statusCode} >>>> ${response.data} >> ');

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        if (response.statusCode == 401) {
          return Left(ServerException(false, 'Unauthorized!, Login Again'));
        }

        if (response.statusCode == 422) {
          return Left(ServerException(false, response.data['message']));
        }

        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        try {
          final cv = converter(response.data);
          return Right(cv);
        } on Exception catch (e) {
          return Left(MachineFailure(e.toString()));
        }
      }
      try {
        final isolateParse = IsolateParser<T>(
          response.data as Map<String, dynamic>,
          converter,
        );
        final result = await isolateParse.parseInBackground();
        return Right(result);
      } on Exception catch (e) {
        return Left(MachineFailure(e.toString()));
      }
    } on DioException {
      return Left(
        ServerFailure(
          'Something went wrong with server!',
        ),
      );
    }
  }

  Future<Either<Failure, T>> putRequest<T>(
    String url,
    String uid, {
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
    bool isIsolate = kIsWeb ? false : true,
  }) async {
    try {
      final response = await dio.put('$url/$uid', data: data);

      //debugPrint('${response.statusCode} >>>> ${response.data} >> ');

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        if (response.statusCode == 401) {
          return Left(ServerException(false, 'Unauthorized!, Login Again'));
        }

        if (response.statusCode == 422) {
          return Left(ServerException(false, response.data['message']));
        }

        if (response.statusCode == 500) {
          return Left(ServerException(false, response.data['message']));
        }
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException {
      return Left(
        ServerFailure(
          'Something went wrong with server!',
        ),
      );
    }
  }

  Future<Either<Failure, T>> deleteRequest<T>(
    String url,
    String uid, {
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
    bool isIsolate = kIsWeb ? false : true,
  }) async {
    try {
      final response = await dio.delete('$url/$uid', data: data);


      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        if (response.statusCode == 401) {
          return Left(ServerException(false, 'Unauthorized!, Login Again'));
        }

        if (response.statusCode == 422) {
          return Left(ServerException(false, response.data['message']));
        }
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException {
      return Left(
        ServerFailure(
          'Something went wrong with server!',
        ),
      );
    }
  }



  // Future<T> post<T>(
  //     String url, {
  //       Map<String, dynamic>? data,
  //       Map<String, dynamic>? query,
  //       required ResponseConverter<T> converter,
  //       bool isIsolate = kIsWeb ? false : true,
  //     }) async {
  //   try {
  //     final response = await dio.post(url, data: data, queryParameters: query);
  //
  //     //debugPrint('>>>> ${response.statusCode} <<<<');
  //
  //     if ((response.statusCode ?? 0) < 200 ||
  //         (response.statusCode ?? 0) > 201) {
  //       if (response.statusCode == 401) {
  //         throw ServerException(false, 'Unauthorized!, Login Again');
  //       }
  //
  //       if (response.statusCode == 422) {
  //         throw ServerException(false, response.data['message']);
  //       }
  //       throw DioException(
  //         requestOptions: response.requestOptions,
  //         response: response,
  //       );
  //     }
  //     if (!isIsolate) {
  //       return converter(response.data);
  //     }
  //     final isolateParse = IsolateParser<T>(
  //       response.data as Map<String, dynamic>,
  //       converter,
  //     );
  //     final result = await isolateParse.parseInBackground();
  //     return result;
  //   } on DioException catch (e) {
  //     throw ServerFailure(
  //       e.response?.data['error'] ?? e.message,
  //     );
  //   }
  // }







  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    required ResponseConverter<T> converter,
    bool isIsolate = kIsWeb ? false : true,
  }) async {
    try {
      final response = await dio.post(url, data: data, queryParameters: query);

      debugPrint('>>>> ${response.statusCode} <<<< ${response.toString()}');

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        if (response.statusCode == 401) {
          return Left(ServerException(false, 'Unauthorized!, Login Again'));
        }

        if (response.statusCode == 422) {
          return Left(ServerException(false, response.data['message']));
        }
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException {

      return Left(
        ServerFailure(
          'Something went wrong with server!',
        ),
      );
    }
  }

  Future<FileUploadResponseModel> uploadFileRequest(
    String url, {
    required UploadDataParams params,
    //required ResponseConverter converter,
    bool isIsolate = kIsWeb ? false : true,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          params.file ?? [],
          filename: params.filename,
        ),
        'id': params.id,
        'email': params.email,
        'category': params.category
      });

      final response = await dio.post(url,
          data: formData,
          onSendProgress: (int sent, int total) {},
          options: Options(contentType: 'multipart/form-data'));

      debugPrint('res code :: ${response.statusCode} :: ${response.data}');

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        if (response.statusCode == 401) {
          //return Left(ServerException(false, 'Unauthorized!, Login Again'));
        }

        if (response.statusCode == 422) {
          // return Left(ServerException(false, response.data['message']));
        }
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      if (!isIsolate) {
        // return Right(converter(response.data));
      }

      return FileUploadResponseModel.fromJson(response.data);
      // final isolateParse = IsolateParser(
      //   response.data as Map<String, dynamic>,
      //   converter,
      // );
      //final result = await isolateParse.parseInBackground();
      // return Right(result);
    } on DioException catch (e) {
      e.stackTrace;

      return FileUploadResponseModel.fromJson(const {});
      // return Left(
      //   ServerFailure(
      //     e.response?.data['error'] ?? e.message,
      //   ),
      // );
    }
  }

// Future<Either<Failure, T>> uploadFileRequest<T>(
//   String url, {
//   Map<String, dynamic>? data,
//   required ResponseConverter<T> converter,
//   bool isIsolate = kIsWeb ? false : true,
// }) async {
//   try {
//
//
//     FormData formData = FormData.fromMap({
//       "file": MultipartFile.fromBytes(
//         data?['file'],
//         filename: data?['name'],
//       ),
//       'id': data?['id'],
//       'email': data?['email']
//     });
//
//     final response = await dio.post(url, data: formData,
//         onSendProgress: (int sent, int total) {
//       //progressCallback(sent, total);
//     }, options: Options( contentType: 'multipart/form-data'));
//
//     if ((response.statusCode ?? 0) < 200 ||
//         (response.statusCode ?? 0) > 201) {
//       if (response.statusCode == 401) {
//         return Left(ServerException(false, 'Unauthorized!, Login Again'));
//       }
//
//       if (response.statusCode == 422) {
//         return Left(ServerException(false, response.data['message']));
//       }
//       throw DioException(
//         requestOptions: response.requestOptions,
//         response: response,
//       );
//     }
//     if (!isIsolate) {
//       return Right(converter(response.data));
//     }
//     final isolateParse = IsolateParser<T>(
//       response.data as Map<String, dynamic>,
//       converter,
//     );
//     final result = await isolateParse.parseInBackground();
//     return Right(result);
//   } on DioException catch (e) {
//     return Left(
//       ServerFailure(
//         e.response?.data['error'] ?? e.message,
//       ),
//     );
//   }
// }
}
