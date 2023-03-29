import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int points;
  final void Function() restartQuestionnaire;

  const Result(this.points, this.restartQuestionnaire, {super.key});

  String get resultPhrase {
    if (points < 8) {
      return 'Congratulations!';
    } else if (points < 12) {
      return 'You are so good!';
    } else if (points < 16) {
      return 'Awesome!';
    } else {
      return 'Jedi level!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          resultPhrase,
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: restartQuestionnaire,
          child: const Text('Restart Quiz!',
              style: TextStyle(
                fontSize: 18,
              )),
        )
      ],
    );
  }
}
