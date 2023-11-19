import 'package:flutter/material.dart';

import '../models/question_model.dart';
import '../models/subject_model.dart';




class AppRepository {
  static List<SubjectModel> subjects = [
    SubjectModel(
      color: const Color(0xFFF38A3E),
      subjectName: "Math",
      resultKey: "math_result",
      questions: [
        QuestionModel(
          trueAnswer: 1,
          questionText: "5 x 20 = ?",
          answer4: "70",
          answer3: "80",
          answer2: "90",
          answer1: "100",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "100 / 5 = ?",
          answer4: "30",
          answer3: "20",
          answer2: "15",
          answer1: "12",
        ),
        QuestionModel(
          trueAnswer: 4,
          questionText: "100 / 20 = ?",
          answer4: "5",
          answer3: "10",
          answer2: "8",
          answer1: "7",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "6 x 2 = ?",
          answer4: "13",
          answer3: "12",
          answer2: "10",
          answer1: "7",
        ),
        QuestionModel(
          trueAnswer: 4,
          questionText: "3 x 10 = ?",
          answer4: "30",
          answer3: "13",
          answer2: "31",
          answer1: "17",
        ),QuestionModel(
          trueAnswer: 3,
          questionText: "What is 7 multiplied \n by 3?",
          answer4: "10",
          answer3: "21",
          answer2: "17",
          answer1: "24",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "If you add 8 and 5, \n what is the result?",
          answer4: "14",
          answer3: "13",
          answer2: "12",
          answer1: "11",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "What is the square \n root of 49?",
          answer4: "8",
          answer3: "7",
          answer2: "6",
          answer1: "5",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "If you subtract 9 from \n 15, what is the answer?",
          answer4: "7",
          answer3: "6",
          answer2: "5",
          answer1: "4",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "What is the product \n of 4 and 9?",
          answer4: "45",
          answer3: "36",
          answer2: "27",
          answer1: "24",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "If you divide 18 by 3, \n what is the quotient?",
          answer4: "7",
          answer3: "6",
          answer2: "5",
          answer1: "4",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "What is 3 to the \n power of 4?",
          answer4: "81",
          answer3: "64",
          answer2: "27",
          answer1: "9",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "How many degrees \n are in a right angle?",
          answer4: "180 degrees",
          answer3: "135 degrees",
          answer2: "90 degrees",
          answer1: "45 degrees",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "What is the value of \n π (pi) approximately \n equal to?",
          answer4: "4.20",
          answer3: "3.50",
          answer2: "3.14",
          answer1: "2.71",
        ),
      ],
      iconPath: "assets/icons/math.png",
    ),
    SubjectModel(
      color: const Color(0xFF1457DB),
      resultKey: "english_result",
      subjectName: "English",
      questions: [
        QuestionModel(
          trueAnswer: 2,
          questionText: "I am ... student",
          answer4: "an",
          answer3: "the",
          answer2: "a",
          answer1: "am",
        ),QuestionModel(
          trueAnswer: 2,
          questionText: "Complete the sentence:\n I ____ a book.",
          answer4: "the",
          answer3: "an",
          answer2: "have",
          answer1: "am",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "Choose the correct \n word: She is _____ doctor.",
          answer4: "an",
          answer3: "a",
          answer2: "the",
          answer1: "I am",
        ),
        QuestionModel(
          trueAnswer: 4,
          questionText: "What is the past tense \n of 'eat'?",
          answer4: "ate",
          answer3: "eaten",
          answer2: "eating",
          answer1: "eat",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "Which word is synonym\n for 'happy'?",
          answer4: "sad",
          answer3: "angry",
          answer2: "joyful",
          answer1: "tired",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "What is the plural form \n of 'child'?",
          answer4: "childs",
          answer3: "children",
          answer2: "childes",
          answer1: "child's",
        ),
        QuestionModel(
          trueAnswer: 4,
          questionText: "Identify the verb in the \n sentence: She sings \n beautifully.",
          answer4: "sings",
          answer3: "beautifully",
          answer2: "She",
          answer1: "the",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "Choose the correct \n sentence: They are going \n to the park.",
          answer4: "Them is going to the park.",
          answer3: "Their going to the park.",
          answer2: "They am going to the park.",
          answer1: "They are going to the park.",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "Which of the following \n words is an adverb? \n 'Quickly' or 'Table'",
          answer4: "Table",
          answer3: "Quickly",
          answer2: "The",
          answer1: "Is",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "What is the opposite \n of 'dark'?",
          answer4: "Small",
          answer3: "Fast",
          answer2: "Hot",
          answer1: "Light",
        ),
      ],
      iconPath: "assets/icons/english.png",
    ),
    SubjectModel(
      color: const Color(0xFFDD3B3B),
      resultKey: "physics_result",
      subjectName: "Physics",
      questions: [
        QuestionModel(
          trueAnswer: 2,
          questionText: "What is the speed of \n light in a vacuum?",
          answer4: "300 m/s",
          answer3: "186,282 miles per second",
          answer2: "299,792,458 meters/second",
          answer1: "500,000 meters per second",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "Which force is for \n objects falling to the \n ground?",
          answer4: "Magnetic force",
          answer3: "Gravitational force",
          answer2: "Electrostatic force",
          answer1: "Nuclear force",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "What is the SI unit of \n force?",
          answer4: "Ampere",
          answer3: "Coulomb",
          answer2: "Joule",
          answer1: "Newton",
        ),
        QuestionModel(
          trueAnswer: 4,
          questionText: "Which of the following \n is a resistance?",
          answer4: "Ohm",
          answer3: "Watt",
          answer2: "Volt",
          answer1: "Ampere",
        ),
        QuestionModel(
          trueAnswer: 3,
          questionText: "What is the SI unit of \n electric charge?",
          answer4: "Ampere",
          answer3: "Coulomb",
          answer2: "Volt",
          answer1: "Watt",
        ),
        QuestionModel(
          trueAnswer: 2,
          questionText: "Which fundamental \n particle carries a positive \n electric charge?",
          answer4: "Neutron",
          answer3: "Proton",
          answer2: "Positron",
          answer1: "Electron",
        ),
        QuestionModel(
          trueAnswer: 1,
          questionText: "term for the bending \n light?",
          answer4: "Reflection",
          answer3: "Dispersion",
          answer2: "Absorption",
          answer1: "Refraction",
        ),
      ],
      iconPath: "assets/icons/phisics.png",
    ),
  ];
}



















