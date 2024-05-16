import 'package:equatable/equatable.dart';

import '../../domain/usecase/customer_profile_usecase.dart';

class CustomerProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class AddCustomerEvent extends CustomerProfileEvent {
  AddCustomerEvent({required this.params});

  final CustomerParams params;
  @override
  List<Object> get props => [params];

}
class FetchCustomersEvent extends CustomerProfileEvent {
  FetchCustomersEvent({required this.page, required this.screen});
  final int page;
  final String screen;

  @override
  List<Object> get props => [];
}


class UpdateCustomerEvent extends CustomerProfileEvent {
  UpdateCustomerEvent(this.uid,this.params);
  final CustomerParams params;
  final String uid;

  @override
  List<Object> get props => [uid, params];
}


class DeleteCustomerEvent extends CustomerProfileEvent {
  DeleteCustomerEvent(this.uid);
  final String uid;
  @override
  List<Object> get props => [uid];
}



