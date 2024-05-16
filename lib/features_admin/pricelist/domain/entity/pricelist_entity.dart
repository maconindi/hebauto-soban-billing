import 'package:equatable/equatable.dart';

class PriceListResponseEntity extends Equatable {
  PriceListResponseEntity({
    required this.status,
    required this.message,
    this.item,
    this.prePageUrl = '',
    this.nextPageUrl = '',
    this.firstPageUrl = '',
    this.lastPageUrl = '',
    this.currentPage = 0,
    this.lastPage = 0,
  });

  final bool status;
  final String message;
  final dynamic item;
  final String prePageUrl;
  final String nextPageUrl;
  final String firstPageUrl;
  final String lastPageUrl;
  final int currentPage;
  final int lastPage;

  @override
  // TODO: implement props
  List<Object?> get props => [status, message];
}

class PriceListEntity {
  const PriceListEntity(
      {this.url = '',
      this.cusId = '',
      this.cusEmail = '',
      this.cusCompany = '',
      this.cusName = '',
      this.updatedAt,
      this.createdAt});

  final String url;
  final String cusId;
  final String cusEmail;
  final String cusName;
  final String cusCompany;
  final String? updatedAt;
  final String? createdAt;
}
