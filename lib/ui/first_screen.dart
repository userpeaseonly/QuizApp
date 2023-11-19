import 'package:flutter/material.dart';
import 'package:quiz_app1/test_data/repository.dart';

import 'math_questions.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F2834),
      appBar: AppBar(
        toolbarHeight: 126.0,
        elevation: 0,
        backgroundColor: const Color(0xFF2F2834),
        title: const Row(
          children: [
            Text(
              "Subjects",
              style: TextStyle(
                fontSize: 34,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 35),
          for (int i = 0; i < AppRepository.subjects.length; i++)
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MathQuestions(
                          subjectModel: AppRepository.subjects[i],
                        );
                      },
                    ), // Navigate to MathQuestions screen
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: 360,
                  height: 126,
                  decoration: BoxDecoration(
                    color: AppRepository.subjects[i].color,
                    borderRadius: BorderRadius.circular(32.0), // Adjust the radius as needed
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          AppRepository.subjects[i].subjectName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppRepository.subjects[i].iconPath, // Replace with your image path
                          width: 116, // Adjust image width
                          height: 116, // Adjust image height
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
