import 'package:hebauto/features_admin/dashboard/domain/entities/add_customer_entity.dart';

class AddCustomerModel extends AddCustomerEntity {
  AddCustomerModel(
      {required super.status, required super.message, required super.customer});

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) =>
      AddCustomerModel(
        status: json['status'],
        message: json['message'],
        customer: json['customer'] != null ? CustomerModelA.fromJson(json['customer']):
             const CustomerModelA(),
      );
}

class CustomerModelA extends Customer {
  const CustomerModelA(
      {super.name,
      super.email,
      super.phone,
      super.companyName,
      // super.updatedAt,
      // super.createdAt,
      super.id});

  factory CustomerModelA.fromJson(Map<String, dynamic> json) => CustomerModelA(
        id: json['id'] ?? 0,
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        companyName: json['company_name'],
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
      );
}
