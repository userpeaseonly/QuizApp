import 'package:flutter/material.dart';
import 'package:quiz_app1/models/subject_model.dart';
import 'package:quiz_app1/ui/results_screen.dart';
import '../models/question_model.dart';
import 'dart:async';

class MathQuestions extends StatefulWidget {
  final SubjectModel subjectModel;

  MathQuestions({required this.subjectModel});

  @override
  _MathQuestionsState createState() => _MathQuestionsState();
}

class _MathQuestionsState extends State<MathQuestions> {
  int currentQuestionIndex = 0;
  Map<int, int?> selectedAnswers = {}; // Map to store selected answers
  int correctAnswers = 0; // Track correct answers
  late Timer _timer;
  int _elapsedSeconds = 0;
  String _formattedTime = '0:00';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _elapsedSeconds++;
        _formattedTime = _formatTime(_elapsedSeconds);
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString();
    String formattedSeconds =
    remainingSeconds < 10 ? '0$remainingSeconds' : remainingSeconds.toString();
    return '$formattedMinutes:$formattedSeconds';
  }

  double _calculatePercentage() {
    // Calculate percentage logic
    // You can use the correctAnswers and totalQuestions to calculate this.
    if (widget.subjectModel.questions.isEmpty) {
      return 0.0;
    }
    return correctAnswers / widget.subjectModel.questions.length;
  }

  @override
  Widget build(BuildContext context) {
    final QuestionModel currentQuestion =
    widget.subjectModel.questions[currentQuestionIndex];

    void selectAnswer(int selectedOption) {
      if (selectedOption == currentQuestion.trueAnswer - 1) {
        correctAnswers++;
      }

      setState(() {
        selectedAnswers[currentQuestionIndex] = selectedOption;
      });
    }

    void goToNextQuestionOrResult() {
      setState(() {
        if (currentQuestionIndex < widget.subjectModel.questions.length - 1) {
          currentQuestionIndex++;
        } else {
          _timer.cancel(); // Stop the timer
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) {
              return ResultsScreen(
                subjectModel: widget.subjectModel,
                correctAnswers: correctAnswers,
                totalQuestions: widget.subjectModel.questions.length,
                elapsedTime: _elapsedSeconds,
              );
            },
          ));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 126.0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: widget.subjectModel.color,
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
      backgroundColor: const Color(0xFF2F2834),
      body: Column(
        children: [
          const SizedBox(height: 35),
          Center(
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                color: widget.subjectModel.color,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Text(
                      "${currentQuestionIndex + 1}. ${currentQuestion.questionText}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: Text(
                      'Time: $_formattedTime',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < 4; i++)
            Center(
              child: GestureDetector(
                onTap: () {
                  selectAnswer(i);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: 360,
                  decoration: BoxDecoration(
                    color: selectedAnswers[currentQuestionIndex] == i
                        ? Colors.green
                        : widget.subjectModel.color,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          i == 0
                              ? currentQuestion.answer1
                              : i == 1
                              ? currentQuestion.answer2
                              : i == 2
                              ? currentQuestion.answer3
                              : currentQuestion.answer4,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                goToNextQuestionOrResult();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: widget.subjectModel.color,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentQuestionIndex ==
                          widget.subjectModel.questions.length - 1
                          ? "See Results"
                          : "Next",
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
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
