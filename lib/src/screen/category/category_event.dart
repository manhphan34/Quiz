class CategoryEvent  {
}

class CategoryLoadingEvent extends CategoryEvent {}

class CategoryLoadedEvent extends CategoryEvent {}

class CategorySelectQuizNumberEvent extends CategoryEvent {
  final int quantity;

  CategorySelectQuizNumberEvent({this.quantity});

  @override
  bool operator ==(Object other) {
    return quantity == other;
  }

  @override
  int get hashCode => super.hashCode;
}

class CategorySelectQuizDifficultyEvent extends CategoryEvent {
  final String difficulty;

  CategorySelectQuizDifficultyEvent({this.difficulty});

  @override
  bool operator ==(Object other) {
    return difficulty == other;
  }

  @override
  int get hashCode => super.hashCode;
}

class CategoryLoadNumberQuestionEvent extends CategoryEvent {
  final int catId;

  CategoryLoadNumberQuestionEvent({this.catId});

  @override
  bool operator ==(Object other) {
    return catId == other;
  }

  @override
  int get hashCode => super.hashCode;
}
