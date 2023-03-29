import 'package:flutter/material.dart';
import 'package:my_quiz/result.dart';
import 'questionnaire.dart';

main() => runApp(const MyQuizApp());

class _MyQuizState extends State<MyQuizApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;

  final _questions = const [
    {
      'text': 'What is the correct answer to 2 + 2 ?',
      'answer': [
        {'text': '2', 'points': 0},
        {'text': '4', 'points': 10},
        {'text': '8', 'points': 0},
        {'text': '16', 'points': 0},
      ],
    },
    {
      'text': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'points': 10},
        {'text': 'Snake', 'points': 5},
        {'text': 'Elephant', 'points': 3},
        {'text': 'Lion', 'points': 1},
      ],
    },
    {
      'text': 'Who\'s your favorite instructor?',
      'answer': [
        {'text': 'Maria', 'points': 10},
        {'text': 'João', 'points': 5},
        {'text': 'Leo', 'points': 3},
        {'text': 'Pedro', 'points': 1},
      ],
    },
  ];

  void _onAnswer(int points) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalPoints += points;
      });
    }

    print(_totalPoints);
  }

  void _restartQuestionnaire() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My Quiz'),
      ),
      body: hasSelectedQuestion
          ? Questionnaire(
              questions: _questions,
              selectedQuestion: _selectedQuestion,
              onAnswer: _onAnswer)
          : Result(_totalPoints, _restartQuestionnaire),
    ));
  }
}

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({super.key});

  @override
  _MyQuizState createState() {
    return _MyQuizState();
  }
}
