import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hebauto/features_admin/pricelist/domain/usecase/pricelist_usecase.dart';
import 'package:meta/meta.dart';

import '../../../customer_profile/domain/entity/customer_entity.dart';

@immutable
abstract class PriceListEvent extends Equatable {

  @override
  List<Object> get props => [];
}


class AddPriceListEvent extends PriceListEvent {
  AddPriceListEvent({required this.params, this.screen = '', required this.file, required this.customer});
  final PriceListParams params;
  final PlatformFile file;
  final CustomerEntity customer;
  final String screen;
  @override
  List<Object> get props => [params, screen, file, customer];

}

class FetchPriceListEvent extends PriceListEvent {
  FetchPriceListEvent({required this.params, this.screen = ''});
  final PriceListParams params;
  final String screen;
  @override
  List<Object> get props => [params, screen];

}


class ResetPriceListEvent extends PriceListEvent {
  ResetPriceListEvent();

  @override
  List<Object> get props => [];

}

class DeletePriceListEvent extends PriceListEvent {
  DeletePriceListEvent({required this.params, this.screen= '',required this.customer, this.url = ''});
  final PriceListParams params;
  final CustomerEntity customer;
  final String url;
  final String screen;
  @override
  List<Object> get props => [params, screen, customer, url];

}


