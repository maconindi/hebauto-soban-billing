import 'package:equatable/equatable.dart';

class FileUploadResponseModel extends Equatable {

  factory FileUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      FileUploadResponseModel(
          status: json['status'] ?? false,
          message: json['message'] ?? '',
          url: json['url'] ?? '');

  const FileUploadResponseModel(
      {required this.status, required this.message, required this.url});
  final bool status;
  final String message;
  final String url;

  @override
  List<Object?> get props => [status, message, url];
}
