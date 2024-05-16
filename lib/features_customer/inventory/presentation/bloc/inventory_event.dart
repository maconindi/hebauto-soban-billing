

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';




@immutable
sealed class CustomerInventoryEventX extends Equatable {

  @override
  List<Object> get props => [];
}




class FetchInventoryEvent extends CustomerInventoryEventX {
  FetchInventoryEvent({this.page = 1});
  final int page;
  @override
  List<Object> get props => [page];

}

class SearchInventoryEvent extends CustomerInventoryEventX {
  SearchInventoryEvent({this.page = 1 , required this.args, required this.category});
  final int page;
  final String args;
  final String category;
  @override
  List<Object> get props => [page, args, category];

}

class ResetInventoryState extends CustomerInventoryEventX {
  ResetInventoryState();

  @override
  List<Object> get props => [];

}

