// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final DateTime date;
  final String image;
  UserData(
      {@required this.id,
      @required this.name,
      this.date,
      @required this.image});
  factory UserData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return UserData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'image': serializer.toJson<String>(image),
    };
  }

  UserData copyWith({int id, String name, DateTime date, String image}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(date.hashCode, image.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.image == this.image);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String> image;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.image = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.date = const Value.absent(),
    @required String image,
  })  : name = Value(name),
        image = Value(image);
  static Insertable<UserData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> date,
    Expression<String> image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (image != null) 'image': image,
    });
  }

  UserCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> date,
      Value<String> image}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, date, image];
  @override
  $UserTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user';
  @override
  final String actualTableName = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

class QuizData extends DataClass implements Insertable<QuizData> {
  final int id;
  final int idCat;
  final String description;
  final String A;
  final String B;
  final String C;
  final String D;
  final int result;
  QuizData(
      {@required this.id,
      @required this.idCat,
      @required this.description,
      @required this.A,
      @required this.B,
      @required this.C,
      @required this.D,
      @required this.result});
  factory QuizData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return QuizData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idCat: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_cat']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      A: stringType.mapFromDatabaseResponse(data['${effectivePrefix}a']),
      B: stringType.mapFromDatabaseResponse(data['${effectivePrefix}b']),
      C: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c']),
      D: stringType.mapFromDatabaseResponse(data['${effectivePrefix}d']),
      result: intType.mapFromDatabaseResponse(data['${effectivePrefix}result']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idCat != null) {
      map['id_cat'] = Variable<int>(idCat);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || A != null) {
      map['a'] = Variable<String>(A);
    }
    if (!nullToAbsent || B != null) {
      map['b'] = Variable<String>(B);
    }
    if (!nullToAbsent || C != null) {
      map['c'] = Variable<String>(C);
    }
    if (!nullToAbsent || D != null) {
      map['d'] = Variable<String>(D);
    }
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<int>(result);
    }
    return map;
  }

  QuizCompanion toCompanion(bool nullToAbsent) {
    return QuizCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idCat:
          idCat == null && nullToAbsent ? const Value.absent() : Value(idCat),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      A: A == null && nullToAbsent ? const Value.absent() : Value(A),
      B: B == null && nullToAbsent ? const Value.absent() : Value(B),
      C: C == null && nullToAbsent ? const Value.absent() : Value(C),
      D: D == null && nullToAbsent ? const Value.absent() : Value(D),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
    );
  }

  factory QuizData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return QuizData(
      id: serializer.fromJson<int>(json['id']),
      idCat: serializer.fromJson<int>(json['idCat']),
      description: serializer.fromJson<String>(json['description']),
      A: serializer.fromJson<String>(json['A']),
      B: serializer.fromJson<String>(json['B']),
      C: serializer.fromJson<String>(json['C']),
      D: serializer.fromJson<String>(json['D']),
      result: serializer.fromJson<int>(json['result']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCat': serializer.toJson<int>(idCat),
      'description': serializer.toJson<String>(description),
      'A': serializer.toJson<String>(A),
      'B': serializer.toJson<String>(B),
      'C': serializer.toJson<String>(C),
      'D': serializer.toJson<String>(D),
      'result': serializer.toJson<int>(result),
    };
  }

  QuizData copyWith(
          {int id,
          int idCat,
          String description,
          String A,
          String B,
          String C,
          String D,
          int result}) =>
      QuizData(
        id: id ?? this.id,
        idCat: idCat ?? this.idCat,
        description: description ?? this.description,
        A: A ?? this.A,
        B: B ?? this.B,
        C: C ?? this.C,
        D: D ?? this.D,
        result: result ?? this.result,
      );
  @override
  String toString() {
    return (StringBuffer('QuizData(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('description: $description, ')
          ..write('A: $A, ')
          ..write('B: $B, ')
          ..write('C: $C, ')
          ..write('D: $D, ')
          ..write('result: $result')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idCat.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  A.hashCode,
                  $mrjc(
                      B.hashCode,
                      $mrjc(
                          C.hashCode, $mrjc(D.hashCode, result.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is QuizData &&
          other.id == this.id &&
          other.idCat == this.idCat &&
          other.description == this.description &&
          other.A == this.A &&
          other.B == this.B &&
          other.C == this.C &&
          other.D == this.D &&
          other.result == this.result);
}

class QuizCompanion extends UpdateCompanion<QuizData> {
  final Value<int> id;
  final Value<int> idCat;
  final Value<String> description;
  final Value<String> A;
  final Value<String> B;
  final Value<String> C;
  final Value<String> D;
  final Value<int> result;
  const QuizCompanion({
    this.id = const Value.absent(),
    this.idCat = const Value.absent(),
    this.description = const Value.absent(),
    this.A = const Value.absent(),
    this.B = const Value.absent(),
    this.C = const Value.absent(),
    this.D = const Value.absent(),
    this.result = const Value.absent(),
  });
  QuizCompanion.insert({
    this.id = const Value.absent(),
    @required int idCat,
    @required String description,
    @required String A,
    @required String B,
    @required String C,
    @required String D,
    @required int result,
  })  : idCat = Value(idCat),
        description = Value(description),
        A = Value(A),
        B = Value(B),
        C = Value(C),
        D = Value(D),
        result = Value(result);
  static Insertable<QuizData> custom({
    Expression<int> id,
    Expression<int> idCat,
    Expression<String> description,
    Expression<String> A,
    Expression<String> B,
    Expression<String> C,
    Expression<String> D,
    Expression<int> result,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCat != null) 'id_cat': idCat,
      if (description != null) 'description': description,
      if (A != null) 'a': A,
      if (B != null) 'b': B,
      if (C != null) 'c': C,
      if (D != null) 'd': D,
      if (result != null) 'result': result,
    });
  }

  QuizCompanion copyWith(
      {Value<int> id,
      Value<int> idCat,
      Value<String> description,
      Value<String> A,
      Value<String> B,
      Value<String> C,
      Value<String> D,
      Value<int> result}) {
    return QuizCompanion(
      id: id ?? this.id,
      idCat: idCat ?? this.idCat,
      description: description ?? this.description,
      A: A ?? this.A,
      B: B ?? this.B,
      C: C ?? this.C,
      D: D ?? this.D,
      result: result ?? this.result,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCat.present) {
      map['id_cat'] = Variable<int>(idCat.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (A.present) {
      map['a'] = Variable<String>(A.value);
    }
    if (B.present) {
      map['b'] = Variable<String>(B.value);
    }
    if (C.present) {
      map['c'] = Variable<String>(C.value);
    }
    if (D.present) {
      map['d'] = Variable<String>(D.value);
    }
    if (result.present) {
      map['result'] = Variable<int>(result.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizCompanion(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('description: $description, ')
          ..write('A: $A, ')
          ..write('B: $B, ')
          ..write('C: $C, ')
          ..write('D: $D, ')
          ..write('result: $result')
          ..write(')'))
        .toString();
  }
}

class $QuizTable extends Quiz with TableInfo<$QuizTable, QuizData> {
  final GeneratedDatabase _db;
  final String _alias;
  $QuizTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idCatMeta = const VerificationMeta('idCat');
  GeneratedIntColumn _idCat;
  @override
  GeneratedIntColumn get idCat => _idCat ??= _constructIdCat();
  GeneratedIntColumn _constructIdCat() {
    return GeneratedIntColumn(
      'id_cat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _AMeta = const VerificationMeta('A');
  GeneratedTextColumn _A;
  @override
  GeneratedTextColumn get A => _A ??= _constructA();
  GeneratedTextColumn _constructA() {
    return GeneratedTextColumn(
      'a',
      $tableName,
      false,
    );
  }

  final VerificationMeta _BMeta = const VerificationMeta('B');
  GeneratedTextColumn _B;
  @override
  GeneratedTextColumn get B => _B ??= _constructB();
  GeneratedTextColumn _constructB() {
    return GeneratedTextColumn(
      'b',
      $tableName,
      false,
    );
  }

  final VerificationMeta _CMeta = const VerificationMeta('C');
  GeneratedTextColumn _C;
  @override
  GeneratedTextColumn get C => _C ??= _constructC();
  GeneratedTextColumn _constructC() {
    return GeneratedTextColumn(
      'c',
      $tableName,
      false,
    );
  }

  final VerificationMeta _DMeta = const VerificationMeta('D');
  GeneratedTextColumn _D;
  @override
  GeneratedTextColumn get D => _D ??= _constructD();
  GeneratedTextColumn _constructD() {
    return GeneratedTextColumn(
      'd',
      $tableName,
      false,
    );
  }

  final VerificationMeta _resultMeta = const VerificationMeta('result');
  GeneratedIntColumn _result;
  @override
  GeneratedIntColumn get result => _result ??= _constructResult();
  GeneratedIntColumn _constructResult() {
    return GeneratedIntColumn(
      'result',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idCat, description, A, B, C, D, result];
  @override
  $QuizTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'quiz';
  @override
  final String actualTableName = 'quiz';
  @override
  VerificationContext validateIntegrity(Insertable<QuizData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_cat')) {
      context.handle(
          _idCatMeta, idCat.isAcceptableOrUnknown(data['id_cat'], _idCatMeta));
    } else if (isInserting) {
      context.missing(_idCatMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('a')) {
      context.handle(_AMeta, A.isAcceptableOrUnknown(data['a'], _AMeta));
    } else if (isInserting) {
      context.missing(_AMeta);
    }
    if (data.containsKey('b')) {
      context.handle(_BMeta, B.isAcceptableOrUnknown(data['b'], _BMeta));
    } else if (isInserting) {
      context.missing(_BMeta);
    }
    if (data.containsKey('c')) {
      context.handle(_CMeta, C.isAcceptableOrUnknown(data['c'], _CMeta));
    } else if (isInserting) {
      context.missing(_CMeta);
    }
    if (data.containsKey('d')) {
      context.handle(_DMeta, D.isAcceptableOrUnknown(data['d'], _DMeta));
    } else if (isInserting) {
      context.missing(_DMeta);
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result'], _resultMeta));
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return QuizData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $QuizTable createAlias(String alias) {
    return $QuizTable(_db, alias);
  }
}

class PointData extends DataClass implements Insertable<PointData> {
  final int id;
  final int idCat;
  final int point;
  final DateTime date;
  PointData(
      {@required this.id,
      @required this.idCat,
      @required this.point,
      @required this.date});
  factory PointData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PointData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idCat: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_cat']),
      point: intType.mapFromDatabaseResponse(data['${effectivePrefix}point']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idCat != null) {
      map['id_cat'] = Variable<int>(idCat);
    }
    if (!nullToAbsent || point != null) {
      map['point'] = Variable<int>(point);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  PointCompanion toCompanion(bool nullToAbsent) {
    return PointCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idCat:
          idCat == null && nullToAbsent ? const Value.absent() : Value(idCat),
      point:
          point == null && nullToAbsent ? const Value.absent() : Value(point),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory PointData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PointData(
      id: serializer.fromJson<int>(json['id']),
      idCat: serializer.fromJson<int>(json['idCat']),
      point: serializer.fromJson<int>(json['point']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCat': serializer.toJson<int>(idCat),
      'point': serializer.toJson<int>(point),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  PointData copyWith({int id, int idCat, int point, DateTime date}) =>
      PointData(
        id: id ?? this.id,
        idCat: idCat ?? this.idCat,
        point: point ?? this.point,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PointData(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('point: $point, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(idCat.hashCode, $mrjc(point.hashCode, date.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PointData &&
          other.id == this.id &&
          other.idCat == this.idCat &&
          other.point == this.point &&
          other.date == this.date);
}

class PointCompanion extends UpdateCompanion<PointData> {
  final Value<int> id;
  final Value<int> idCat;
  final Value<int> point;
  final Value<DateTime> date;
  const PointCompanion({
    this.id = const Value.absent(),
    this.idCat = const Value.absent(),
    this.point = const Value.absent(),
    this.date = const Value.absent(),
  });
  PointCompanion.insert({
    this.id = const Value.absent(),
    @required int idCat,
    @required int point,
    @required DateTime date,
  })  : idCat = Value(idCat),
        point = Value(point),
        date = Value(date);
  static Insertable<PointData> custom({
    Expression<int> id,
    Expression<int> idCat,
    Expression<int> point,
    Expression<DateTime> date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCat != null) 'id_cat': idCat,
      if (point != null) 'point': point,
      if (date != null) 'date': date,
    });
  }

  PointCompanion copyWith(
      {Value<int> id,
      Value<int> idCat,
      Value<int> point,
      Value<DateTime> date}) {
    return PointCompanion(
      id: id ?? this.id,
      idCat: idCat ?? this.idCat,
      point: point ?? this.point,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idCat.present) {
      map['id_cat'] = Variable<int>(idCat.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointCompanion(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('point: $point, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $PointTable extends Point with TableInfo<$PointTable, PointData> {
  final GeneratedDatabase _db;
  final String _alias;
  $PointTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idCatMeta = const VerificationMeta('idCat');
  GeneratedIntColumn _idCat;
  @override
  GeneratedIntColumn get idCat => _idCat ??= _constructIdCat();
  GeneratedIntColumn _constructIdCat() {
    return GeneratedIntColumn(
      'id_cat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _pointMeta = const VerificationMeta('point');
  GeneratedIntColumn _point;
  @override
  GeneratedIntColumn get point => _point ??= _constructPoint();
  GeneratedIntColumn _constructPoint() {
    return GeneratedIntColumn(
      'point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, idCat, point, date];
  @override
  $PointTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'point';
  @override
  final String actualTableName = 'point';
  @override
  VerificationContext validateIntegrity(Insertable<PointData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_cat')) {
      context.handle(
          _idCatMeta, idCat.isAcceptableOrUnknown(data['id_cat'], _idCatMeta));
    } else if (isInserting) {
      context.missing(_idCatMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point'], _pointMeta));
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PointData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PointTable createAlias(String alias) {
    return $PointTable(_db, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  final String description;
  final String icon;
  CategoryData(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.icon});
  factory CategoryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CategoryData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      icon: stringType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
    };
  }

  CategoryData copyWith(
          {int id, String name, String description, String icon}) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(description.hashCode, icon.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> icon;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    @required String icon,
  })  : name = Value(name),
        description = Value(description),
        icon = Value(icon);
  static Insertable<CategoryData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<String> icon,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
    });
  }

  CategoryCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> icon}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  GeneratedTextColumn _icon;
  @override
  GeneratedTextColumn get icon => _icon ??= _constructIcon();
  GeneratedTextColumn _constructIcon() {
    return GeneratedTextColumn(
      'icon',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, description, icon];
  @override
  $CategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'category';
  @override
  final String actualTableName = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CategoryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UserTable _user;
  $UserTable get user => _user ??= $UserTable(this);
  $QuizTable _quiz;
  $QuizTable get quiz => _quiz ??= $QuizTable(this);
  $PointTable _point;
  $PointTable get point => _point ??= $PointTable(this);
  $CategoryTable _category;
  $CategoryTable get category => _category ??= $CategoryTable(this);
  ModesDao _modesDao;
  ModesDao get modesDao => _modesDao ??= ModesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, quiz, point, category];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ModesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTable get user => attachedDatabase.user;
  $QuizTable get quiz => attachedDatabase.quiz;
  $PointTable get point => attachedDatabase.point;
  $CategoryTable get category => attachedDatabase.category;
}
