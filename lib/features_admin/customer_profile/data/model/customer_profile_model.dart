import '../../domain/entity/customer_entity.dart';

class CustomerProfileResponseModel extends CustomerResponseEntity {
  CustomerProfileResponseModel({
    required super.item,
    required super.status,
    required super.message,
    required super.prePageUrl,
    required super.nextPageUrl,
    required super.firstPageUrl,
    required super.lastPageUrl,
    required super.currentPage,
    required super.lastPage,
  });

  factory CustomerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      CustomerProfileResponseModel(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        item: json['item'],
        prePageUrl: json['prev_page_url'] ?? '',
        nextPageUrl: json['next_page_url'] ?? '',
        firstPageUrl: json['first_page_url'] ?? '',
        lastPageUrl: json['last_page_url'] ?? '',
        currentPage: json['current_page'] ?? 0,
        lastPage: json['last_page'] ?? 0,
      );
}

class CustomerModel extends CustomerEntity {
  const CustomerModel(
      {required super.id,
      required super.cusId,
      required super.name,
      required super.email,
      required super.phone,
      required super.tradingLicense,
      required super.country,
      required super.address,
      required super.companyName,
      required super.createdAt,
      required super.updatedAt});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
      id: json['id'] ?? 0,
      cusId: json['cus_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      companyName: json['company_name'] ?? '',
      tradingLicense: json['trading_license'] ?? '',
      createdAt: DateTime.parse(json['updated_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      country:  json['country'] ?? '',
      address:  json['company_address'] ?? '');
}
