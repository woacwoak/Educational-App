import 'dart:math';
import "package:flutter/material.dart";
import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogicPage extends StatefulWidget {
  const LogicPage({super.key});

  @override
  State<LogicPage> createState() => _LogicPageState();
}

class _LogicPageState extends State<LogicPage> {
  late int questionIndex = Random().nextInt(3) + 1;
  void onAnswerSelected(BuildContext context, String answer) {
    String correctAnswer = {1: 'circle', 2: 'star', 3: 'star'}[questionIndex]!;

    if (answer == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct!'), duration: Duration(milliseconds: 200), behavior: SnackBarBehavior.floating),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Try again!'), duration: Duration(milliseconds: 200), behavior: SnackBarBehavior.floating),
      );
    }
    setState(() {
      questionIndex = Random().nextInt(3) + 1;
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Color(0xffFFF2D9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
                decoration: BoxDecoration(
                  color: Color(0xffFFD580),
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
                child: SvgPicture.asset(
                  'assets/images/logic_problem$questionIndex.svg',
                  width: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            )
          ),

          SizedBox(height: 10),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 22,
                crossAxisSpacing: 30,
                children: [
                for (var answer in ['circle', 'square', 'triangle', 'star'])
                  AnswerButton(
                    answer: answer,
                    onPressed: () => onAnswerSelected(context, answer),
                  ),
                ],
              ),
            ),
          ),
        ]
      )
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
        backgroundColor: Color(0xffFF9F1C),
        minimumSize: Size(double.infinity, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: SvgPicture.asset(
        'assets/images/$answer.svg',
        fit: BoxFit.contain,
      ),
    );
  }
}
