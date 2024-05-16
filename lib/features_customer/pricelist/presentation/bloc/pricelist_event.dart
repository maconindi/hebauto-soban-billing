import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/customer_pricelist_usecase.dart';

@immutable
abstract class CustomerPriceListEvent extends Equatable {

  @override
  List<Object> get props => [];
}




class FetchPriceListEvent extends CustomerPriceListEvent {
  FetchPriceListEvent({required this.params, this.screen = ''});
  final CustomerPriceListParams params;
  final String screen;
  @override
  List<Object> get props => [params, screen];

}


class ResetPriceListEvent extends CustomerPriceListEvent {
  ResetPriceListEvent();

  @override
  List<Object> get props => [];

}






