import "package:flutter/material.dart";
import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogicPage extends StatelessWidget {
  const LogicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
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
                  'assets/images/logic_problem1.svg',
                  width: 400,
                  fit: BoxFit.contain,
                  ),
              ),
            ),
            )
          ),
        ]
      )
    );
  }
}