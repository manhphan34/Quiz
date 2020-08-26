import 'package:equatable/equatable.dart';
class CategoryEvent extends Equatable{
  @override
  List<Object> get props =>[];
}

class CategoryLoadingEvent extends CategoryEvent {}

class CategoryLoadedEvent extends CategoryEvent {}