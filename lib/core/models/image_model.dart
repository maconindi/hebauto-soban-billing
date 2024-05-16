import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final int id;
  final String url;
  final String category;
  final int inventId;
  final DateTime updatedAt;
  final DateTime createdAt;

  const ImageModel(
      {required this.category,
      required this.inventId,
      required this.updatedAt,
      required this.createdAt,
      required this.id,
      required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        url: json['url'],
        category: json['category'],
        inventId: json['invent_id'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
      );

  @override
  List<Object?> get props =>
      [id, url, category, inventId, updatedAt, createdAt];
}
