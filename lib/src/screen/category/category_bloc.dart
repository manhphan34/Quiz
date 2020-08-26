import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/src/data/local/database.dart';
import 'package:quiz/src/screen/category/category_event.dart';
import 'package:quiz/src/screen/category/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategorySate> {
  var db = AppDatabase.getInstance().modesDao;
  var cats = List<CategoryData>();

  CategoryBloc() : super(CategoryInitState());

  @override
  Stream<CategorySate> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryLoadingEvent) {
      await db.getCategories.then((value) => cats = value);
      yield CategoryLoadedState(cats: cats);
    }
  }
}
