class ResponseModel {

  factory ResponseModel.fromJson(Map<String, dynamic> json, {String entityName = 'item'}) => ResponseModel(
    status: json['status'] ?? '',
    message: json['message'] ?? '' ,
    item: json['item'] ?? {} ,
  );

  ResponseModel({
    this.status = false,
    this.message = '',
    this.item
  });

  final bool status;
  final String message;
  Map<String, dynamic>? item;
}


class ResponseModelList {

  factory ResponseModelList.fromJson(Map<String, dynamic> json, {String entityName = 'item'}) => ResponseModelList(
    status: json['status'] ?? '',
    message: json['message'] ?? '' ,
    item: json['data'] ?? [],
  );

  ResponseModelList({
    this.status = false,
    this.message = '',
    this.item = const []
  });

  final bool status;
  final String message;
  List<dynamic> item;
}