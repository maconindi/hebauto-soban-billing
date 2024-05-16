import 'dart:convert';


import 'package:hebauto/core/network/api/list_api.dart';
import 'package:universal_html/html.dart';


import '../../../injection.dart';
import '../../network/api/dio_client.dart';
import 'file_manager_interface.dart';

class FileManager implements FileManagerInterface {
  @override
  Future<void> downloadMultiple(List<String> urls, String fileName) async {

    fileName = fileName.trim();
    final res = await getIt<DioClient>().dio.post(ListAPI.downloadFiles,
        data: {'fileName': fileName, 'fileUrls': urls});

    //debugPrint('>> ${res.statusCode} >> ${res.statusMessage}');

    if(res.statusCode == 200){
      List<int> fileBytes = base64Decode(res.data);

      AnchorElement(
          href: 'data:application/zip;base64,${base64Encode(fileBytes)}')
        ..setAttribute('download', '$fileName.zip')
        ..click();

    }


    // final url = Uri.parse('https://i.imgur.com/PmsxMum.jpg');
    // final response = await http.get(url);
    // final blob = html.Blob([response.bodyBytes]);
    // final anchorElement = html.AnchorElement(
    //   href: html.Url.createObjectUrlFromBlob(blob).toString(),
    // )..setAttribute('download', 'suragch.jpg');
    // html.document.body!.children.add(anchorElement);
    // anchorElement.click();
    // html.document.body!.children.remove(anchorElement);
  }

  @override
  Future<void> downloadSingle(String url, String fileName) async {
    final res = await getIt<DioClient>().dio.post(ListAPI.downloadFile,
        data: {'fileName': fileName, 'fileUrl': url});

    List<int> fileBytes = base64Decode(res.data);

    AnchorElement(
        href: 'data:application/zip;base64,${base64Encode(fileBytes)}')
      ..setAttribute('download', '$fileName.zip')
      ..click();
  }
}
