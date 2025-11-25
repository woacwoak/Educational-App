import 'dart:math';
import 'package:flutter/material.dart';
import 'package:curious_bear/widgets/custom_app_bar.dart';


class MathPage extends StatefulWidget {
  const MathPage({super.key});

  @override
  State<MathPage> createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  late int num1;
  late int num2;
  late int correctAnswer;
  late List<int> answers = [];

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final random = Random();
    num1 = random.nextInt(10);
    num2 = random.nextInt(10);
    correctAnswer = num1 + num2;

    answers = [correctAnswer];

    while (answers.length < 4) {
      answers.add(random.nextInt(20));
    }

    answers.shuffle();
  }
  void onAnswerSelected(int answer) {
    if (answer == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Try again!')),
      );
    }
    setState((){
      generateQuestion();
    });
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Color(0xffFFF2D9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                decoration: BoxDecoration(
                  color: Color(0xffE3F4D7),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              child: Text(
                '$num1 + $num2 = ?',
                style: TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4C4A2E),
                ),
              ),
              ),
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 30,
                children: [
                for (var answer in answers)
                  AnswerButton(
                    answer: answer.toString(),
                    onPressed: () => onAnswerSelected(answer),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String answer;

  const AnswerButton({
    super.key,
    required this.onPressed,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff6BCB77),
        minimumSize: Size(double.infinity, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        answer,
        style: TextStyle(fontSize: 80, color: Colors.white, fontFamily: 'Itim'),
      ),
    );
  }
}