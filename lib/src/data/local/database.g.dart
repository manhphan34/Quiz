// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String mobile;
  final DateTime date;
  final String image;
  final String imageCover;
  final int ePoint;
  final int mPoint;
  final int hPoint;
  final int goldPoint;
  final int silverPoint;
  final int bronzePoint;
  final int rankPoint;
  final int rank;
  UserData(
      {@required this.id,
      @required this.name,
      @required this.mobile,
      this.date,
      @required this.image,
      this.imageCover,
      this.ePoint,
      this.mPoint,
      this.hPoint,
      this.goldPoint,
      this.silverPoint,
      this.bronzePoint,
      this.rankPoint,
      this.rank});
  factory UserData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return UserData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      mobile:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}mobile']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      imageCover: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_cover']),
      ePoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}e_point']),
      mPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m_point']),
      hPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}h_point']),
      goldPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}gold_point']),
      silverPoint: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}silver_point']),
      bronzePoint: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bronze_point']),
      rankPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}rank_point']),
      rank: intType.mapFromDatabaseResponse(data['${effectivePrefix}rank']),
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
    if (!nullToAbsent || mobile != null) {
      map['mobile'] = Variable<String>(mobile);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || imageCover != null) {
      map['image_cover'] = Variable<String>(imageCover);
    }
    if (!nullToAbsent || ePoint != null) {
      map['e_point'] = Variable<int>(ePoint);
    }
    if (!nullToAbsent || mPoint != null) {
      map['m_point'] = Variable<int>(mPoint);
    }
    if (!nullToAbsent || hPoint != null) {
      map['h_point'] = Variable<int>(hPoint);
    }
    if (!nullToAbsent || goldPoint != null) {
      map['gold_point'] = Variable<int>(goldPoint);
    }
    if (!nullToAbsent || silverPoint != null) {
      map['silver_point'] = Variable<int>(silverPoint);
    }
    if (!nullToAbsent || bronzePoint != null) {
      map['bronze_point'] = Variable<int>(bronzePoint);
    }
    if (!nullToAbsent || rankPoint != null) {
      map['rank_point'] = Variable<int>(rankPoint);
    }
    if (!nullToAbsent || rank != null) {
      map['rank'] = Variable<int>(rank);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      mobile:
          mobile == null && nullToAbsent ? const Value.absent() : Value(mobile),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      imageCover: imageCover == null && nullToAbsent
          ? const Value.absent()
          : Value(imageCover),
      ePoint:
          ePoint == null && nullToAbsent ? const Value.absent() : Value(ePoint),
      mPoint:
          mPoint == null && nullToAbsent ? const Value.absent() : Value(mPoint),
      hPoint:
          hPoint == null && nullToAbsent ? const Value.absent() : Value(hPoint),
      goldPoint: goldPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(goldPoint),
      silverPoint: silverPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(silverPoint),
      bronzePoint: bronzePoint == null && nullToAbsent
          ? const Value.absent()
          : Value(bronzePoint),
      rankPoint: rankPoint == null && nullToAbsent
          ? const Value.absent()
          : Value(rankPoint),
      rank: rank == null && nullToAbsent ? const Value.absent() : Value(rank),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      mobile: serializer.fromJson<String>(json['mobile']),
      date: serializer.fromJson<DateTime>(json['date']),
      image: serializer.fromJson<String>(json['image']),
      imageCover: serializer.fromJson<String>(json['imageCover']),
      ePoint: serializer.fromJson<int>(json['ePoint']),
      mPoint: serializer.fromJson<int>(json['mPoint']),
      hPoint: serializer.fromJson<int>(json['hPoint']),
      goldPoint: serializer.fromJson<int>(json['goldPoint']),
      silverPoint: serializer.fromJson<int>(json['silverPoint']),
      bronzePoint: serializer.fromJson<int>(json['bronzePoint']),
      rankPoint: serializer.fromJson<int>(json['rankPoint']),
      rank: serializer.fromJson<int>(json['rank']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'mobile': serializer.toJson<String>(mobile),
      'date': serializer.toJson<DateTime>(date),
      'image': serializer.toJson<String>(image),
      'imageCover': serializer.toJson<String>(imageCover),
      'ePoint': serializer.toJson<int>(ePoint),
      'mPoint': serializer.toJson<int>(mPoint),
      'hPoint': serializer.toJson<int>(hPoint),
      'goldPoint': serializer.toJson<int>(goldPoint),
      'silverPoint': serializer.toJson<int>(silverPoint),
      'bronzePoint': serializer.toJson<int>(bronzePoint),
      'rankPoint': serializer.toJson<int>(rankPoint),
      'rank': serializer.toJson<int>(rank),
    };
  }

  UserData copyWith(
          {int id,
          String name,
          String mobile,
          DateTime date,
          String image,
          String imageCover,
          int ePoint,
          int mPoint,
          int hPoint,
          int goldPoint,
          int silverPoint,
          int bronzePoint,
          int rankPoint,
          int rank}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        date: date ?? this.date,
        image: image ?? this.image,
        imageCover: imageCover ?? this.imageCover,
        ePoint: ePoint ?? this.ePoint,
        mPoint: mPoint ?? this.mPoint,
        hPoint: hPoint ?? this.hPoint,
        goldPoint: goldPoint ?? this.goldPoint,
        silverPoint: silverPoint ?? this.silverPoint,
        bronzePoint: bronzePoint ?? this.bronzePoint,
        rankPoint: rankPoint ?? this.rankPoint,
        rank: rank ?? this.rank,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('mobile: $mobile, ')
          ..write('date: $date, ')
          ..write('image: $image, ')
          ..write('imageCover: $imageCover, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint, ')
          ..write('goldPoint: $goldPoint, ')
          ..write('silverPoint: $silverPoint, ')
          ..write('bronzePoint: $bronzePoint, ')
          ..write('rankPoint: $rankPoint, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              mobile.hashCode,
              $mrjc(
                  date.hashCode,
                  $mrjc(
                      image.hashCode,
                      $mrjc(
                          imageCover.hashCode,
                          $mrjc(
                              ePoint.hashCode,
                              $mrjc(
                                  mPoint.hashCode,
                                  $mrjc(
                                      hPoint.hashCode,
                                      $mrjc(
                                          goldPoint.hashCode,
                                          $mrjc(
                                              silverPoint.hashCode,
                                              $mrjc(
                                                  bronzePoint.hashCode,
                                                  $mrjc(rankPoint.hashCode,
                                                      rank.hashCode))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.mobile == this.mobile &&
          other.date == this.date &&
          other.image == this.image &&
          other.imageCover == this.imageCover &&
          other.ePoint == this.ePoint &&
          other.mPoint == this.mPoint &&
          other.hPoint == this.hPoint &&
          other.goldPoint == this.goldPoint &&
          other.silverPoint == this.silverPoint &&
          other.bronzePoint == this.bronzePoint &&
          other.rankPoint == this.rankPoint &&
          other.rank == this.rank);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> mobile;
  final Value<DateTime> date;
  final Value<String> image;
  final Value<String> imageCover;
  final Value<int> ePoint;
  final Value<int> mPoint;
  final Value<int> hPoint;
  final Value<int> goldPoint;
  final Value<int> silverPoint;
  final Value<int> bronzePoint;
  final Value<int> rankPoint;
  final Value<int> rank;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.mobile = const Value.absent(),
    this.date = const Value.absent(),
    this.image = const Value.absent(),
    this.imageCover = const Value.absent(),
    this.ePoint = const Value.absent(),
    this.mPoint = const Value.absent(),
    this.hPoint = const Value.absent(),
    this.goldPoint = const Value.absent(),
    this.silverPoint = const Value.absent(),
    this.bronzePoint = const Value.absent(),
    this.rankPoint = const Value.absent(),
    this.rank = const Value.absent(),
  });
  UserCompanion.insert({
    @required int id,
    @required String name,
    @required String mobile,
    this.date = const Value.absent(),
    @required String image,
    this.imageCover = const Value.absent(),
    this.ePoint = const Value.absent(),
    this.mPoint = const Value.absent(),
    this.hPoint = const Value.absent(),
    this.goldPoint = const Value.absent(),
    this.silverPoint = const Value.absent(),
    this.bronzePoint = const Value.absent(),
    this.rankPoint = const Value.absent(),
    this.rank = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        mobile = Value(mobile),
        image = Value(image);
  static Insertable<UserData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> mobile,
    Expression<DateTime> date,
    Expression<String> image,
    Expression<String> imageCover,
    Expression<int> ePoint,
    Expression<int> mPoint,
    Expression<int> hPoint,
    Expression<int> goldPoint,
    Expression<int> silverPoint,
    Expression<int> bronzePoint,
    Expression<int> rankPoint,
    Expression<int> rank,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (mobile != null) 'mobile': mobile,
      if (date != null) 'date': date,
      if (image != null) 'image': image,
      if (imageCover != null) 'image_cover': imageCover,
      if (ePoint != null) 'e_point': ePoint,
      if (mPoint != null) 'm_point': mPoint,
      if (hPoint != null) 'h_point': hPoint,
      if (goldPoint != null) 'gold_point': goldPoint,
      if (silverPoint != null) 'silver_point': silverPoint,
      if (bronzePoint != null) 'bronze_point': bronzePoint,
      if (rankPoint != null) 'rank_point': rankPoint,
      if (rank != null) 'rank': rank,
    });
  }

  UserCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> mobile,
      Value<DateTime> date,
      Value<String> image,
      Value<String> imageCover,
      Value<int> ePoint,
      Value<int> mPoint,
      Value<int> hPoint,
      Value<int> goldPoint,
      Value<int> silverPoint,
      Value<int> bronzePoint,
      Value<int> rankPoint,
      Value<int> rank}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      date: date ?? this.date,
      image: image ?? this.image,
      imageCover: imageCover ?? this.imageCover,
      ePoint: ePoint ?? this.ePoint,
      mPoint: mPoint ?? this.mPoint,
      hPoint: hPoint ?? this.hPoint,
      goldPoint: goldPoint ?? this.goldPoint,
      silverPoint: silverPoint ?? this.silverPoint,
      bronzePoint: bronzePoint ?? this.bronzePoint,
      rankPoint: rankPoint ?? this.rankPoint,
      rank: rank ?? this.rank,
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
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (imageCover.present) {
      map['image_cover'] = Variable<String>(imageCover.value);
    }
    if (ePoint.present) {
      map['e_point'] = Variable<int>(ePoint.value);
    }
    if (mPoint.present) {
      map['m_point'] = Variable<int>(mPoint.value);
    }
    if (hPoint.present) {
      map['h_point'] = Variable<int>(hPoint.value);
    }
    if (goldPoint.present) {
      map['gold_point'] = Variable<int>(goldPoint.value);
    }
    if (silverPoint.present) {
      map['silver_point'] = Variable<int>(silverPoint.value);
    }
    if (bronzePoint.present) {
      map['bronze_point'] = Variable<int>(bronzePoint.value);
    }
    if (rankPoint.present) {
      map['rank_point'] = Variable<int>(rankPoint.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('mobile: $mobile, ')
          ..write('date: $date, ')
          ..write('image: $image, ')
          ..write('imageCover: $imageCover, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint, ')
          ..write('goldPoint: $goldPoint, ')
          ..write('silverPoint: $silverPoint, ')
          ..write('bronzePoint: $bronzePoint, ')
          ..write('rankPoint: $rankPoint, ')
          ..write('rank: $rank')
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

  final VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  GeneratedTextColumn _mobile;
  @override
  GeneratedTextColumn get mobile => _mobile ??= _constructMobile();
  GeneratedTextColumn _constructMobile() {
    return GeneratedTextColumn(
      'mobile',
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

  final VerificationMeta _imageCoverMeta = const VerificationMeta('imageCover');
  GeneratedTextColumn _imageCover;
  @override
  GeneratedTextColumn get imageCover => _imageCover ??= _constructImageCover();
  GeneratedTextColumn _constructImageCover() {
    return GeneratedTextColumn(
      'image_cover',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ePointMeta = const VerificationMeta('ePoint');
  GeneratedIntColumn _ePoint;
  @override
  GeneratedIntColumn get ePoint => _ePoint ??= _constructEPoint();
  GeneratedIntColumn _constructEPoint() {
    return GeneratedIntColumn(
      'e_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _mPointMeta = const VerificationMeta('mPoint');
  GeneratedIntColumn _mPoint;
  @override
  GeneratedIntColumn get mPoint => _mPoint ??= _constructMPoint();
  GeneratedIntColumn _constructMPoint() {
    return GeneratedIntColumn(
      'm_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _hPointMeta = const VerificationMeta('hPoint');
  GeneratedIntColumn _hPoint;
  @override
  GeneratedIntColumn get hPoint => _hPoint ??= _constructHPoint();
  GeneratedIntColumn _constructHPoint() {
    return GeneratedIntColumn(
      'h_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _goldPointMeta = const VerificationMeta('goldPoint');
  GeneratedIntColumn _goldPoint;
  @override
  GeneratedIntColumn get goldPoint => _goldPoint ??= _constructGoldPoint();
  GeneratedIntColumn _constructGoldPoint() {
    return GeneratedIntColumn(
      'gold_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _silverPointMeta =
      const VerificationMeta('silverPoint');
  GeneratedIntColumn _silverPoint;
  @override
  GeneratedIntColumn get silverPoint =>
      _silverPoint ??= _constructSilverPoint();
  GeneratedIntColumn _constructSilverPoint() {
    return GeneratedIntColumn(
      'silver_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bronzePointMeta =
      const VerificationMeta('bronzePoint');
  GeneratedIntColumn _bronzePoint;
  @override
  GeneratedIntColumn get bronzePoint =>
      _bronzePoint ??= _constructBronzePoint();
  GeneratedIntColumn _constructBronzePoint() {
    return GeneratedIntColumn(
      'bronze_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _rankPointMeta = const VerificationMeta('rankPoint');
  GeneratedIntColumn _rankPoint;
  @override
  GeneratedIntColumn get rankPoint => _rankPoint ??= _constructRankPoint();
  GeneratedIntColumn _constructRankPoint() {
    return GeneratedIntColumn(
      'rank_point',
      $tableName,
      true,
    );
  }

  final VerificationMeta _rankMeta = const VerificationMeta('rank');
  GeneratedIntColumn _rank;
  @override
  GeneratedIntColumn get rank => _rank ??= _constructRank();
  GeneratedIntColumn _constructRank() {
    return GeneratedIntColumn(
      'rank',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        mobile,
        date,
        image,
        imageCover,
        ePoint,
        mPoint,
        hPoint,
        goldPoint,
        silverPoint,
        bronzePoint,
        rankPoint,
        rank
      ];
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile'], _mobileMeta));
    } else if (isInserting) {
      context.missing(_mobileMeta);
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
    if (data.containsKey('image_cover')) {
      context.handle(
          _imageCoverMeta,
          imageCover.isAcceptableOrUnknown(
              data['image_cover'], _imageCoverMeta));
    }
    if (data.containsKey('e_point')) {
      context.handle(_ePointMeta,
          ePoint.isAcceptableOrUnknown(data['e_point'], _ePointMeta));
    }
    if (data.containsKey('m_point')) {
      context.handle(_mPointMeta,
          mPoint.isAcceptableOrUnknown(data['m_point'], _mPointMeta));
    }
    if (data.containsKey('h_point')) {
      context.handle(_hPointMeta,
          hPoint.isAcceptableOrUnknown(data['h_point'], _hPointMeta));
    }
    if (data.containsKey('gold_point')) {
      context.handle(_goldPointMeta,
          goldPoint.isAcceptableOrUnknown(data['gold_point'], _goldPointMeta));
    }
    if (data.containsKey('silver_point')) {
      context.handle(
          _silverPointMeta,
          silverPoint.isAcceptableOrUnknown(
              data['silver_point'], _silverPointMeta));
    }
    if (data.containsKey('bronze_point')) {
      context.handle(
          _bronzePointMeta,
          bronzePoint.isAcceptableOrUnknown(
              data['bronze_point'], _bronzePointMeta));
    }
    if (data.containsKey('rank_point')) {
      context.handle(_rankPointMeta,
          rankPoint.isAcceptableOrUnknown(data['rank_point'], _rankPointMeta));
    }
    if (data.containsKey('rank')) {
      context.handle(
          _rankMeta, rank.isAcceptableOrUnknown(data['rank'], _rankMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
  final DateTime date;
  final int ePoint;
  final int mPoint;
  final int hPoint;
  PointData(
      {@required this.id,
      @required this.idCat,
      @required this.date,
      @required this.ePoint,
      @required this.mPoint,
      @required this.hPoint});
  factory PointData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return PointData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idCat: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_cat']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      ePoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}e_point']),
      mPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m_point']),
      hPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}h_point']),
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
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || ePoint != null) {
      map['e_point'] = Variable<int>(ePoint);
    }
    if (!nullToAbsent || mPoint != null) {
      map['m_point'] = Variable<int>(mPoint);
    }
    if (!nullToAbsent || hPoint != null) {
      map['h_point'] = Variable<int>(hPoint);
    }
    return map;
  }

  PointCompanion toCompanion(bool nullToAbsent) {
    return PointCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idCat:
          idCat == null && nullToAbsent ? const Value.absent() : Value(idCat),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      ePoint:
          ePoint == null && nullToAbsent ? const Value.absent() : Value(ePoint),
      mPoint:
          mPoint == null && nullToAbsent ? const Value.absent() : Value(mPoint),
      hPoint:
          hPoint == null && nullToAbsent ? const Value.absent() : Value(hPoint),
    );
  }

  factory PointData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PointData(
      id: serializer.fromJson<int>(json['id']),
      idCat: serializer.fromJson<int>(json['idCat']),
      date: serializer.fromJson<DateTime>(json['date']),
      ePoint: serializer.fromJson<int>(json['ePoint']),
      mPoint: serializer.fromJson<int>(json['mPoint']),
      hPoint: serializer.fromJson<int>(json['hPoint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idCat': serializer.toJson<int>(idCat),
      'date': serializer.toJson<DateTime>(date),
      'ePoint': serializer.toJson<int>(ePoint),
      'mPoint': serializer.toJson<int>(mPoint),
      'hPoint': serializer.toJson<int>(hPoint),
    };
  }

  PointData copyWith(
          {int id,
          int idCat,
          DateTime date,
          int ePoint,
          int mPoint,
          int hPoint}) =>
      PointData(
        id: id ?? this.id,
        idCat: idCat ?? this.idCat,
        date: date ?? this.date,
        ePoint: ePoint ?? this.ePoint,
        mPoint: mPoint ?? this.mPoint,
        hPoint: hPoint ?? this.hPoint,
      );
  @override
  String toString() {
    return (StringBuffer('PointData(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('date: $date, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idCat.hashCode,
          $mrjc(
              date.hashCode,
              $mrjc(
                  ePoint.hashCode, $mrjc(mPoint.hashCode, hPoint.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PointData &&
          other.id == this.id &&
          other.idCat == this.idCat &&
          other.date == this.date &&
          other.ePoint == this.ePoint &&
          other.mPoint == this.mPoint &&
          other.hPoint == this.hPoint);
}

class PointCompanion extends UpdateCompanion<PointData> {
  final Value<int> id;
  final Value<int> idCat;
  final Value<DateTime> date;
  final Value<int> ePoint;
  final Value<int> mPoint;
  final Value<int> hPoint;
  const PointCompanion({
    this.id = const Value.absent(),
    this.idCat = const Value.absent(),
    this.date = const Value.absent(),
    this.ePoint = const Value.absent(),
    this.mPoint = const Value.absent(),
    this.hPoint = const Value.absent(),
  });
  PointCompanion.insert({
    this.id = const Value.absent(),
    @required int idCat,
    @required DateTime date,
    @required int ePoint,
    @required int mPoint,
    @required int hPoint,
  })  : idCat = Value(idCat),
        date = Value(date),
        ePoint = Value(ePoint),
        mPoint = Value(mPoint),
        hPoint = Value(hPoint);
  static Insertable<PointData> custom({
    Expression<int> id,
    Expression<int> idCat,
    Expression<DateTime> date,
    Expression<int> ePoint,
    Expression<int> mPoint,
    Expression<int> hPoint,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idCat != null) 'id_cat': idCat,
      if (date != null) 'date': date,
      if (ePoint != null) 'e_point': ePoint,
      if (mPoint != null) 'm_point': mPoint,
      if (hPoint != null) 'h_point': hPoint,
    });
  }

  PointCompanion copyWith(
      {Value<int> id,
      Value<int> idCat,
      Value<DateTime> date,
      Value<int> ePoint,
      Value<int> mPoint,
      Value<int> hPoint}) {
    return PointCompanion(
      id: id ?? this.id,
      idCat: idCat ?? this.idCat,
      date: date ?? this.date,
      ePoint: ePoint ?? this.ePoint,
      mPoint: mPoint ?? this.mPoint,
      hPoint: hPoint ?? this.hPoint,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (ePoint.present) {
      map['e_point'] = Variable<int>(ePoint.value);
    }
    if (mPoint.present) {
      map['m_point'] = Variable<int>(mPoint.value);
    }
    if (hPoint.present) {
      map['h_point'] = Variable<int>(hPoint.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointCompanion(')
          ..write('id: $id, ')
          ..write('idCat: $idCat, ')
          ..write('date: $date, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint')
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

  final VerificationMeta _ePointMeta = const VerificationMeta('ePoint');
  GeneratedIntColumn _ePoint;
  @override
  GeneratedIntColumn get ePoint => _ePoint ??= _constructEPoint();
  GeneratedIntColumn _constructEPoint() {
    return GeneratedIntColumn(
      'e_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mPointMeta = const VerificationMeta('mPoint');
  GeneratedIntColumn _mPoint;
  @override
  GeneratedIntColumn get mPoint => _mPoint ??= _constructMPoint();
  GeneratedIntColumn _constructMPoint() {
    return GeneratedIntColumn(
      'm_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hPointMeta = const VerificationMeta('hPoint');
  GeneratedIntColumn _hPoint;
  @override
  GeneratedIntColumn get hPoint => _hPoint ??= _constructHPoint();
  GeneratedIntColumn _constructHPoint() {
    return GeneratedIntColumn(
      'h_point',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idCat, date, ePoint, mPoint, hPoint];
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
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('e_point')) {
      context.handle(_ePointMeta,
          ePoint.isAcceptableOrUnknown(data['e_point'], _ePointMeta));
    } else if (isInserting) {
      context.missing(_ePointMeta);
    }
    if (data.containsKey('m_point')) {
      context.handle(_mPointMeta,
          mPoint.isAcceptableOrUnknown(data['m_point'], _mPointMeta));
    } else if (isInserting) {
      context.missing(_mPointMeta);
    }
    if (data.containsKey('h_point')) {
      context.handle(_hPointMeta,
          hPoint.isAcceptableOrUnknown(data['h_point'], _hPointMeta));
    } else if (isInserting) {
      context.missing(_hPointMeta);
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

class TitleData extends DataClass implements Insertable<TitleData> {
  final int id;
  final String title;
  final int ePoint;
  final int mPoint;
  final int hPoint;
  final String icon;
  final String status;
  TitleData(
      {@required this.id,
      @required this.title,
      @required this.ePoint,
      @required this.mPoint,
      @required this.hPoint,
      @required this.icon,
      @required this.status});
  factory TitleData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TitleData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      ePoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}e_point']),
      mPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m_point']),
      hPoint:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}h_point']),
      icon: stringType.mapFromDatabaseResponse(data['${effectivePrefix}icon']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || ePoint != null) {
      map['e_point'] = Variable<int>(ePoint);
    }
    if (!nullToAbsent || mPoint != null) {
      map['m_point'] = Variable<int>(mPoint);
    }
    if (!nullToAbsent || hPoint != null) {
      map['h_point'] = Variable<int>(hPoint);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  TitleCompanion toCompanion(bool nullToAbsent) {
    return TitleCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      ePoint:
          ePoint == null && nullToAbsent ? const Value.absent() : Value(ePoint),
      mPoint:
          mPoint == null && nullToAbsent ? const Value.absent() : Value(mPoint),
      hPoint:
          hPoint == null && nullToAbsent ? const Value.absent() : Value(hPoint),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory TitleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TitleData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      ePoint: serializer.fromJson<int>(json['ePoint']),
      mPoint: serializer.fromJson<int>(json['mPoint']),
      hPoint: serializer.fromJson<int>(json['hPoint']),
      icon: serializer.fromJson<String>(json['icon']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'ePoint': serializer.toJson<int>(ePoint),
      'mPoint': serializer.toJson<int>(mPoint),
      'hPoint': serializer.toJson<int>(hPoint),
      'icon': serializer.toJson<String>(icon),
      'status': serializer.toJson<String>(status),
    };
  }

  TitleData copyWith(
          {int id,
          String title,
          int ePoint,
          int mPoint,
          int hPoint,
          String icon,
          String status}) =>
      TitleData(
        id: id ?? this.id,
        title: title ?? this.title,
        ePoint: ePoint ?? this.ePoint,
        mPoint: mPoint ?? this.mPoint,
        hPoint: hPoint ?? this.hPoint,
        icon: icon ?? this.icon,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('TitleData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint, ')
          ..write('icon: $icon, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              ePoint.hashCode,
              $mrjc(
                  mPoint.hashCode,
                  $mrjc(hPoint.hashCode,
                      $mrjc(icon.hashCode, status.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TitleData &&
          other.id == this.id &&
          other.title == this.title &&
          other.ePoint == this.ePoint &&
          other.mPoint == this.mPoint &&
          other.hPoint == this.hPoint &&
          other.icon == this.icon &&
          other.status == this.status);
}

class TitleCompanion extends UpdateCompanion<TitleData> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> ePoint;
  final Value<int> mPoint;
  final Value<int> hPoint;
  final Value<String> icon;
  final Value<String> status;
  const TitleCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.ePoint = const Value.absent(),
    this.mPoint = const Value.absent(),
    this.hPoint = const Value.absent(),
    this.icon = const Value.absent(),
    this.status = const Value.absent(),
  });
  TitleCompanion.insert({
    @required int id,
    @required String title,
    @required int ePoint,
    @required int mPoint,
    @required int hPoint,
    @required String icon,
    @required String status,
  })  : id = Value(id),
        title = Value(title),
        ePoint = Value(ePoint),
        mPoint = Value(mPoint),
        hPoint = Value(hPoint),
        icon = Value(icon),
        status = Value(status);
  static Insertable<TitleData> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<int> ePoint,
    Expression<int> mPoint,
    Expression<int> hPoint,
    Expression<String> icon,
    Expression<String> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (ePoint != null) 'e_point': ePoint,
      if (mPoint != null) 'm_point': mPoint,
      if (hPoint != null) 'h_point': hPoint,
      if (icon != null) 'icon': icon,
      if (status != null) 'status': status,
    });
  }

  TitleCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<int> ePoint,
      Value<int> mPoint,
      Value<int> hPoint,
      Value<String> icon,
      Value<String> status}) {
    return TitleCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      ePoint: ePoint ?? this.ePoint,
      mPoint: mPoint ?? this.mPoint,
      hPoint: hPoint ?? this.hPoint,
      icon: icon ?? this.icon,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (ePoint.present) {
      map['e_point'] = Variable<int>(ePoint.value);
    }
    if (mPoint.present) {
      map['m_point'] = Variable<int>(mPoint.value);
    }
    if (hPoint.present) {
      map['h_point'] = Variable<int>(hPoint.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TitleCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('ePoint: $ePoint, ')
          ..write('mPoint: $mPoint, ')
          ..write('hPoint: $hPoint, ')
          ..write('icon: $icon, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TitleTable extends Title with TableInfo<$TitleTable, TitleData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TitleTable(this._db, [this._alias]);
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

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ePointMeta = const VerificationMeta('ePoint');
  GeneratedIntColumn _ePoint;
  @override
  GeneratedIntColumn get ePoint => _ePoint ??= _constructEPoint();
  GeneratedIntColumn _constructEPoint() {
    return GeneratedIntColumn(
      'e_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mPointMeta = const VerificationMeta('mPoint');
  GeneratedIntColumn _mPoint;
  @override
  GeneratedIntColumn get mPoint => _mPoint ??= _constructMPoint();
  GeneratedIntColumn _constructMPoint() {
    return GeneratedIntColumn(
      'm_point',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hPointMeta = const VerificationMeta('hPoint');
  GeneratedIntColumn _hPoint;
  @override
  GeneratedIntColumn get hPoint => _hPoint ??= _constructHPoint();
  GeneratedIntColumn _constructHPoint() {
    return GeneratedIntColumn(
      'h_point',
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

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, ePoint, mPoint, hPoint, icon, status];
  @override
  $TitleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'title';
  @override
  final String actualTableName = 'title';
  @override
  VerificationContext validateIntegrity(Insertable<TitleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('e_point')) {
      context.handle(_ePointMeta,
          ePoint.isAcceptableOrUnknown(data['e_point'], _ePointMeta));
    } else if (isInserting) {
      context.missing(_ePointMeta);
    }
    if (data.containsKey('m_point')) {
      context.handle(_mPointMeta,
          mPoint.isAcceptableOrUnknown(data['m_point'], _mPointMeta));
    } else if (isInserting) {
      context.missing(_mPointMeta);
    }
    if (data.containsKey('h_point')) {
      context.handle(_hPointMeta,
          hPoint.isAcceptableOrUnknown(data['h_point'], _hPointMeta));
    } else if (isInserting) {
      context.missing(_hPointMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon'], _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TitleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TitleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TitleTable createAlias(String alias) {
    return $TitleTable(_db, alias);
  }
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final int id;
  final String name;
  final String description;
  final int quantity;
  final int price;
  final String type;
  final String image;
  ItemData(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.quantity,
      @required this.price,
      @required this.type,
      @required this.image});
  factory ItemData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return ItemData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      quantity:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      price: intType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
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
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<int>(quantity);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<int>(price);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  ItemCompanion toCompanion(bool nullToAbsent) {
    return ItemCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
      type: serializer.fromJson<String>(json['type']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
      'type': serializer.toJson<String>(type),
      'image': serializer.toJson<String>(image),
    };
  }

  ItemData copyWith(
          {int id,
          String name,
          String description,
          int quantity,
          int price,
          String type,
          String image}) =>
      ItemData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        type: type ?? this.type,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('type: $type, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  quantity.hashCode,
                  $mrjc(price.hashCode,
                      $mrjc(type.hashCode, image.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.type == this.type &&
          other.image == this.image);
}

class ItemCompanion extends UpdateCompanion<ItemData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> quantity;
  final Value<int> price;
  final Value<String> type;
  final Value<String> image;
  const ItemCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.type = const Value.absent(),
    this.image = const Value.absent(),
  });
  ItemCompanion.insert({
    @required int id,
    @required String name,
    @required String description,
    @required int quantity,
    @required int price,
    @required String type,
    @required String image,
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        quantity = Value(quantity),
        price = Value(price),
        type = Value(type),
        image = Value(image);
  static Insertable<ItemData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<int> quantity,
    Expression<int> price,
    Expression<String> type,
    Expression<String> image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (type != null) 'type': type,
      if (image != null) 'image': image,
    });
  }

  ItemCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<int> quantity,
      Value<int> price,
      Value<String> type,
      Value<String> image}) {
    return ItemCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      type: type ?? this.type,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('type: $type, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $ItemTable extends Item with TableInfo<$ItemTable, ItemData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ItemTable(this._db, [this._alias]);
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

  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedIntColumn _quantity;
  @override
  GeneratedIntColumn get quantity => _quantity ??= _constructQuantity();
  GeneratedIntColumn _constructQuantity() {
    return GeneratedIntColumn(
      'quantity',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedIntColumn _price;
  @override
  GeneratedIntColumn get price => _price ??= _constructPrice();
  GeneratedIntColumn _constructPrice() {
    return GeneratedIntColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn(
      'type',
      $tableName,
      false,
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
  List<GeneratedColumn> get $columns =>
      [id, name, description, quantity, price, type, image];
  @override
  $ItemTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'item';
  @override
  final String actualTableName = 'item';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ItemData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ItemData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ItemTable createAlias(String alias) {
    return $ItemTable(_db, alias);
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
  $TitleTable _title;
  $TitleTable get title => _title ??= $TitleTable(this);
  $ItemTable _item;
  $ItemTable get item => _item ??= $ItemTable(this);
  ModesDao _modesDao;
  ModesDao get modesDao => _modesDao ??= ModesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, quiz, point, category, title, item];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ModesDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTable get user => attachedDatabase.user;
  $QuizTable get quiz => attachedDatabase.quiz;
  $PointTable get point => attachedDatabase.point;
  $CategoryTable get category => attachedDatabase.category;
  $TitleTable get title => attachedDatabase.title;
  $ItemTable get item => attachedDatabase.item;
}
