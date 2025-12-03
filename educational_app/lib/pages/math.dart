import 'dart:math';
import 'package:curious_bear/widgets/navigation.dart';
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
  late List<int> answers;

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
    bool isCorrect = answer == correctAnswer;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? 'Correct!' : 'Try again!'),
        duration: const Duration(milliseconds: 200),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isCorrect ? Colors.green : Colors.red,
      ),
    );

    setState(() => generateQuestion());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Responsive sizes
    final questionFontSize = width * 0.18;
    final answerFontSize = width * 0.14;

    return Scaffold(
      appBar: appBar(context, "Math"),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: const Color(0xffFFF2D9),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [

            SizedBox(height: height * 0.02),

            //Question
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffE3F4D7),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset.zero,
                    ),
                    ],
                  ),
                  child: Text(
                    "$num1 + $num2 = ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: questionFontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4C4A2E),
                    ),
                  ),
                ),
              ),

            SizedBox(height: height * 0.01),

            //Answers Grid
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: height * 0.03,
                crossAxisSpacing: width * 0.05,
                childAspectRatio: 1.2,
                children: [
                  for (var ans in answers)
                    AnswerButton(
                      answer: ans.toString(),
                      fontSize: answerFontSize,
                      onPressed: () => onAnswerSelected(ans),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AnswerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String answer;
  final double fontSize;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff6BCB77),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: FittedBox(
        child: Text(
          answer,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Itim',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
