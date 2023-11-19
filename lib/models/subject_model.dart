import 'package:flutter/material.dart';
import 'package:quiz_app1/models/question_model.dart';



class SubjectModel {
  SubjectModel({
    required this.color,
    required this.subjectName,
    required this.questions,
    required this.iconPath,
    required this.resultKey,
  });

  final String subjectName;
  final String iconPath;
  final List<QuestionModel> questions;
  final Color color;
  final String resultKey;




}
