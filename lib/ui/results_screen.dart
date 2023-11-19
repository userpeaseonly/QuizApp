import 'package:flutter/material.dart';
import 'package:quiz_app1/models/subject_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app1/models/subject_model.dart';
import 'package:quiz_app1/ui/results_screen.dart';
import '../main.dart';
import '../models/question_model.dart';
import 'first_screen.dart';

class ResultsScreen extends StatefulWidget {
  final SubjectModel subjectModel;
  final int correctAnswers; // Number of correct answers
  final int totalQuestions; // Total number of questions
  final int elapsedTime;

  ResultsScreen({
    required this.subjectModel,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.elapsedTime,
  });


  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString();
    String formattedSeconds =
    remainingSeconds < 10 ? '0$remainingSeconds' : remainingSeconds.toString();
    return '$formattedMinutes:$formattedSeconds';
  }
  late int currentResult;
  setResult() async {
    currentResult = widget.correctAnswers;

    int? subjectResult = prefs.getInt(widget.subjectModel.resultKey);
    if (subjectResult != null) {
      if (subjectResult < currentResult) {
        prefs.setInt(widget.subjectModel.resultKey, currentResult);
      }
    } else {
      prefs.setInt(widget.subjectModel.resultKey, currentResult);
    }
  }
  showRecord(currentResult){
    return currentResult;
  }

  @override
  void initState() {
    setResult();
    super.initState();
  }



  String getPercentage() {
    // Calculate the percentage of correct answers
    double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;
    return '${percentage.toStringAsFixed(2)}%';
  }

  String getImagePath() {
    double percentage = (widget.correctAnswers / widget.totalQuestions) * 100;
    if (percentage < 60) {
      return 'assets/result_icons/bad.png';
    } else if (percentage >= 60 && percentage < 86) {
      return 'assets/result_icons/avarage.png';
    } else {
      return 'assets/result_icons/best.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 126.0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFF2F2834),
        title: Row(
          children: [
            Text(
              widget.subjectModel.subjectName,
              style: const TextStyle(
                fontSize: 34,
              ),
            ),
            const Spacer(),
            Image.asset(
              widget.subjectModel.iconPath,
              width: 117,
              height: 117,
            ),
          ],
        ),
      ),
      backgroundColor: widget.subjectModel.color,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 22),
            decoration: BoxDecoration(
              color: const Color(0xFF2F2834),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(66, 33, 66, 0),
              child: Column(
                children: [
                                                                //Record
                  const Text(
                    "Record",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    "${prefs.getInt(widget.subjectModel.resultKey)} Correct",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                                                                //Results
                  const Text(
                    "Results",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    "${getPercentage()} Correct",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Time Spent: ${_formatTime(widget.elapsedTime)}", // Display time spent
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2F2834),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Image.asset(
                getImagePath(),
                width: 135,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FirstScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2F2834),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Go To Courses Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}