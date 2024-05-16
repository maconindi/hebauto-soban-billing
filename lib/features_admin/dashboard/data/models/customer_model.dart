import '../../../customer_profile/domain/entity/customer_entity.dart';


class CustomerModel extends CustomerEntity {
  CustomerModel(
      {
        required super.id,
      required super.cusId,
      required super.name,
      required super.email,
      required super.phone,
      required super.tradingLicense,
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
      updatedAt: DateTime.parse(json['updated_at'] ?? ''));
}
