class QuestionModel {
  QuestionModel({
    required this.trueAnswer,
    required this.questionText,
    required this.answer4,
    required this.answer3,
    required this.answer2,
    required this.answer1,
  });

  final String questionText;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final int trueAnswer;
}