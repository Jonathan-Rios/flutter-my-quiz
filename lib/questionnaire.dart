import 'package:flutter/material.dart';
import 'question.dart';
import 'option.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Questionnaire(
      {super.key,
      required this.questions,
      required this.selectedQuestion,
      required this.onAnswer});

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasSelectedQuestion
        ? questions[selectedQuestion]['answer'] as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text'].toString()),
        ...answers
            .map((answer) => Option(answer['text'] as String,
                () => onAnswer(int.parse(answer['points'].toString()))))
            .toList(),
      ],
    );
  }
}
