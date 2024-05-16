// lib/file_manager/file_manager_interface.dart

abstract interface class FileManagerInterface {
  Future<void> downloadMultiple(List<String> urls, String fileName);
  Future<void> downloadSingle(String url, String fileName);
}