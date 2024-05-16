

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/inventory_usecase.dart';




@immutable
sealed class InventoryEventX extends Equatable {
  @override
  List<Object> get props => [];
}



class AddInventoryEvent extends InventoryEventX {
  // final List<PlatformFile> files;
  AddInventoryEvent({required this.params, required this.screen
    // this.files = const []
  });

  final InventoryParams params;
  final String screen;
  @override
  List<Object> get props => [params, screen];

}

class UpdateInventoryEvent extends InventoryEventX {
  UpdateInventoryEvent({required this.params, required this.uid, required this.screen});

  final Object params;
  final String uid;
  final String screen;
  @override
  List<Object> get props => [params, screen];
}


class FetchInventoryEvent extends InventoryEventX {
  FetchInventoryEvent({this.page = 1,required this.screen});
  final int page;
  final String screen;
  @override
  List<Object> get props => [page, screen];

}

class SearchInventoryEvent extends InventoryEventX {
  SearchInventoryEvent({this.page = 1 , required this.args, required this.category});
  final int page;
  final String args;
  final String category;
  @override
  List<Object> get props => [page, args, category];

}

class DeleteInventoryEvent extends InventoryEventX {
  DeleteInventoryEvent(this.id);
  final String id;
  @override
  List<Object> get props => [id];

}