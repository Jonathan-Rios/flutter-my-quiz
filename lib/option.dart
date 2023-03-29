import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String text;
  final void Function() answerQuestion;

  const Option(this.text, this.answerQuestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: answerQuestion,
        child: Text(text),
      ),
    );
  }
}
