import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../features_admin/inventory/domain/usecases/inventory_usecase.dart';
import '../../injection.dart';
import '../network/api/dio_client.dart';
import '../network/api/list_api.dart';

enum UploadImageType {
  VEHICLE,
  TOWING,
  SHIPPING,
  PORT,
  WAREHOUSE,
  WAREHOUSEID,
  VCCID
}

enum UploadPdfType { INVOICE, VCC, OTHER }

class FileUploadService {
  static Future<void> uploadImages(
      {required String inventoryId,
      required List<PlatformFile> files,
      required String category,
      required String customerEmail}) async {
    await Future.forEach(files, (element) async {
      try {
        String url = ListAPI.imageUpload;
        getIt<DioClient>().uploadFileRequest(url,
            params: UploadDataParams(
                id: inventoryId,
                email: customerEmail,
                file: element.bytes,
                filename: element.name,
                category: category.toLowerCase()));
      } on Exception catch (ex) {
        debugPrint('Uploading Exception ${ex.toString()}');
      }
    });
  }

  static Future<void> uploadDocument(
      {required String inventoryId,
      required PlatformFile file,
      required String category,
      required String customerEmail}) async {
    try {
      String url = ListAPI.mediaUpload;
      getIt<DioClient>().uploadFileRequest(
        url,
        params: UploadDataParams(
            id: inventoryId,
            email: customerEmail,
            file: file.bytes,
            filename: file.name,
            category: category.toLowerCase()),
      );
    } on Exception catch (ex) {
      debugPrint('Uploading Exception ${ex.toString()}');
    }
  }

  static Future<String> uploadPriceList(
      {
        required PlatformFile file,
        required String category,
        required String customerEmail}) async {
    try {
      var url = ListAPI.mediaUpload;
      final response = await getIt<DioClient>().uploadFileRequest(
        url,
        params: UploadDataParams(
            email: customerEmail,
            file: file.bytes,
            filename: file.name,
            category: category.toLowerCase()),
      );

      return response.url;


    } on Exception catch (ex) {
      debugPrint('Uploading Exception ${ex.toString()}');
      return '';
    }
  }
}
