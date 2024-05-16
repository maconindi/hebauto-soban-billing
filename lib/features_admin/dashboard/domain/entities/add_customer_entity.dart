import 'package:equatable/equatable.dart';

class AddCustomerEntity extends Equatable {

  const AddCustomerEntity({
    required this.status,
    required this.message,
    required this.customer,
  });
  final bool status;
  final String message;
  final Customer customer;

  @override
  List<Object?> get props => [status, message, customer];

}

class Customer extends Equatable {

  const Customer({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.companyName = '',
    this.id = 0,
  });
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final int id;

  @override
  List<Object?> get props => [name, email, phone, companyName, id];

}
