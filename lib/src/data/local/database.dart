import 'package:moor_flutter/moor_flutter.dart';
import 'package:quiz/src/data/models/category.dart';
import 'package:quiz/src/data/models/quiz_model.dart';
import 'package:quiz/src/data/models/user.dart';

part 'database.g.dart';

class User extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().named('name')();

  TextColumn get mobile => text()();

  DateTimeColumn get date => dateTime().nullable()();

  TextColumn get image => text()();

  TextColumn get imageCover => text().nullable()();

  IntColumn get ePoint => integer().nullable()();

  IntColumn get mPoint => integer().nullable()();

  IntColumn get hPoint => integer().nullable()();

  IntColumn get goldPoint => integer().nullable()();

  IntColumn get silverPoint => integer().nullable()();

  IntColumn get bronzePoint => integer().nullable()();

  IntColumn get rankPoint => integer().nullable()();

  IntColumn get rank => integer().nullable()();
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

  DateTimeColumn get date => dateTime()();

  IntColumn get ePoint => integer()();

  IntColumn get mPoint => integer()();

  IntColumn get hPoint => integer()();
}

class Title extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  IntColumn get ePoint => integer()();

  IntColumn get mPoint => integer()();

  IntColumn get hPoint => integer()();

  TextColumn get icon => text()();

  TextColumn get status => text()();
}

class Item extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  IntColumn get quantity => integer()();

  IntColumn get price => integer()();

  TextColumn get type => text()();

  TextColumn get image => text()();
}

@UseMoor(tables: [User, Quiz, Point, Category, Title, Item], daos: [ModesDao])
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

@UseDao(tables: [User, Quiz, Point, Category, Title, Item])
class ModesDao extends DatabaseAccessor<AppDatabase> with _$ModesDaoMixin {
  ModesDao(AppDatabase db) : super(db);

  Future<List<UserData>> get getUser => select(user).get();

  Future<List<PointData>> get getPoints => select(point).get();

  Future<List<QuizData>> get getQuizzes => select(quiz).get();

  Future<List<TitleData>> get getTitles => select(title).get();

  Future<List<ItemData>> get getItems => select(item).get();

  Future deleteUser() => customStatement("delete from user where 1");

  Future deleteItems() => customStatement("delete from item where 1");

  Future deleteTitles() => customStatement("delete from title where 1");

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

  Future<void> insertItems({List<ItemCompanion> items}) async {
    await batch((batch) => {batch.insertAll(item, items)});
  }

  Future<void> insertTitles({List<TitleCompanion> items}) async {
    await batch((batch) => {batch.insertAll(title, items)});
  }

  Future<void> insertPoint(PointCompanion pointCompanion) {
    return into(point).insert(pointCompanion);
  }

  Future updateUser(int id, String path) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(image: Value(path)),
    );
  }

  Future updateCoverImage(int id, String path) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(imageCover: Value(path)),
    );
  }

  Future updateRank(int id, int pos) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(rank: Value(pos)),
    );
  }

  Future updateTitleStatus(int id, String status) {
    return (update(title)..where((t) => t.id.equals(id))).write(
      TitleCompanion(status: Value(status)),
    );
  }

  Future updateUserPoint(int id, int ePoint, int mPoint, int hPoint) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(
          ePoint: Value(ePoint), mPoint: Value(mPoint), hPoint: Value(hPoint)),
    );
  }

  Future updateUserMedal(
      int id, int bronzePoint, int silverPoint, int goldPoint, int rankPoint) {
    return (update(user)..where((t) => t.id.equals(id))).write(
      UserCompanion(
          bronzePoint: Value(bronzePoint),
          silverPoint: Value(silverPoint),
          goldPoint: Value(goldPoint),
          rankPoint: Value(rankPoint)),
    );
  }

  Future<List<ItemData>> getItemById(int id) {
    return (select(item)..where((tbl) => tbl.id.equals(id))).get();
  }

  Future updateItem(int id, quantity) {
    return (update(item)..where((t) => t.id.equals(id))).write(
      ItemCompanion(quantity: Value(quantity)),
    );
  }

// Future updatePoint(int catId, int p) {
//   return (update(point)..where((t) => t.idCat.equals(catId))).write(
//     PointCompanion(point: Value(p), date: Value(DateTime.now())),
//   );
// }
}
