class QuestionsModel {
  const QuestionsModel(this.ques, this.options);

  final String ques;
  final List<String> options;

  List<String> get shuffledops {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
