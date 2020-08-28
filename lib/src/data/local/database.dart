import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/models/Category.dart';
import 'package:quiz/src/data/models/Quiz.dart';
import 'package:quiz/src/data/models/User.dart';

part 'database.g.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().named('name')();

  DateTimeColumn get date => dateTime().nullable()();

  TextColumn get image => text()();
}


class Category extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  TextColumn get icon => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Quiz extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idCat => integer()();

  TextColumn get description => text()();

  TextColumn get A => text()();

  TextColumn get B => text()();

  TextColumn get C => text()();

  TextColumn get D => text()();

  IntColumn get result => integer()();
}

class Point extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get idCat => integer()();

  IntColumn get point => integer()();

  DateTimeColumn get date => dateTime()();

}

@UseMoor(tables: [User, Quiz, Point, Category], daos: [ModesDao])
class AppDatabase extends _$AppDatabase {
  static AppDatabase _instance;

  static AppDatabase getInstance() {
    if (_instance == null) {
      _instance = AppDatabase();
    }
    return _instance;
  }
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
  ));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [User, Quiz, Point, Category])
class ModesDao extends DatabaseAccessor<AppDatabase> with _$ModesDaoMixin {
  ModesDao(AppDatabase db) : super(db);

  Future<List<UserData>> get getUser => select(user).get();

  Future<List<PointData>> get getPoints => select(point).get();

  Future<List<QuizData>> get getQuizzes => select(quiz).get();

  Future<List<QuizData>> getQuizzesByCat(int id) {
    return (select(quiz)..where((tbl) => tbl.idCat.equals(id))).get();
  }

  Future<List<CategoryData>> get getCategories => select(category).get();

  Future<int> insertUser({UserModel userModel}) {
    return into(user).insert(userModel.convert());
  }

  Future<void> insertQuizzes({List<QuizModel> quizzes}) async {
    await batch((batch) => {batch.insertAll(quiz, convertToQuizzes(quizzes))});
  }

  Future<void> insertCategories({List<CategoryModel> cats}) async {
    await batch(
            (batch) => {batch.insertAll(category, convertToCategories(cats))});
  }

  Future<void> insertPoint(PointCompanion pointCompanion) {
    return into(point).insert(pointCompanion);
  }

  Future updateUser(int id, String path) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(image: Value(path)),
    );
  }

  Future updatePoint(int catId, int p) {
    return (update(point)..where((t) => t.idCat.equals(catId))).write(
      PointCompanion(point: Value(p), date: Value(DateTime.now())),
    );
  }
}
