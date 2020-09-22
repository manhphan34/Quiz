import 'package:quiz/src/data/local/database.dart';

class StoreState {}

class StoreInitialState extends StoreState {}

class StoreGetItemState extends StoreState {
  final List<ItemData> items;

  StoreGetItemState({this.items});
}

class StoreUpdateItemState extends StoreState {}

class UseItemState extends StoreState {
  final ItemData item;
  final bool isSingle;

  UseItemState(this.item, this.isSingle);
}

class StoreUpdateState extends StoreState{
  final bool isSingle;

  StoreUpdateState(this.isSingle);
}
