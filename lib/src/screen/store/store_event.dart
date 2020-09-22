import 'package:quiz/src/data/local/database.dart';
class StoreEvent {}

class StoreInitialEvent extends StoreEvent {}

class StoreGetItemEvent extends StoreEvent {}

class StoreUpdateItemEvent extends StoreEvent {
  final int id;
  final int quantity;

  StoreUpdateItemEvent({this.id, this.quantity});
}

class UseItemEvent extends StoreEvent{
  final ItemData item;
  final bool isSingle;

  UseItemEvent(this.item, this.isSingle);
}

class StoreUpdateEvent extends StoreEvent{
  final bool isSingle;

  StoreUpdateEvent(this.isSingle);
}
