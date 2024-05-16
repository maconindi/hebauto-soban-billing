import 'package:equatable/equatable.dart';


class CustomerResponseEntity {
  CustomerResponseEntity({
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
}




class CustomerEntity extends Equatable {

  const CustomerEntity(
      {this.id = 0,
        this.name = '',
        this.cusId = '',
        this.email = '',
        this.phone = '',
        this.tradingLicense = '',
        this.country = '',
        this.address = '',
        this.companyName = '',
        this.createdAt,
        this.updatedAt
      });
  final int id;
  final String cusId;
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String country;
  final String address;
  //final String companyName;
  final String tradingLicense;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  @override
  List<Object?> get props => [
    name,
    cusId,
    email,
    phone,
    companyName,
    id,
    createdAt,
    updatedAt,
    tradingLicense
  ];
}
