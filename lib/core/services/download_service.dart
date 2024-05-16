//
// import 'package:hebauto/core/network/api/api.dart';
// import 'package:hebauto/injection.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:universal_html/html.dart' as html;
//
// abstract class DownloadService {
//   Future<void> download({required String url, required String name});
// }
//
// class WebDownloadService implements DownloadService {
//   @override
//   Future<void> download({required List<String> url, required String name}) async {
//     html.window.open(url, '_blank');
//   }
// }
//
// class MobileDownloadService implements DownloadService {
//   @override
//   Future<void> download({required String url, required String name}) async {
//     bool hasPermission = await _requestWritePermission();
//     if (!hasPermission) return;
//
//
//     var dir = await getApplicationDocumentsDirectory();
//
//     // You should put the name you want for the file here.
//     // Take in account the extension.
//     String fileName = name;
//     await getIt<DioClient>().dio.download(url, '${dir.path}/$fileName');
//     OpenFile.open('${dir.path}/$fileName', type: 'application/pdf');
//   }
//
//   Future<bool> _requestWritePermission() async {
//     await Permission.storage.request();
//     return await Permission.storage.request().isGranted;
//   }
// }