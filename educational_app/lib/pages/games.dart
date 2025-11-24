import 'package:curious_bear/pages/math.dart';
import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/button.dart';


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),

      body: Container(
        color: Color(0xffFFF2D9),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/bear_games.png',
                width: 400,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 10),
              GameButton(text: "Math", color: Color(0xff6BCB77), gamePage: MathPage()),
              const SizedBox(height: 10),
              GameButton(text: "Memory", color: Color(0xff5BC0EB), gamePage: Placeholder()),
              const SizedBox(height: 10),
              GameButton(text: "Logic", color: Color(0xffFF9F1C), gamePage: Placeholder()),
            ],
          ),
        ),
      ),
    );
  }
}
