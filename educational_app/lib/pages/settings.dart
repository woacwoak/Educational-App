import "package:curious_bear/widgets/navigation.dart";
import "package:flutter/material.dart";
import "../widgets/custom_app_bar.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: Color(0xffFFF2D9),
      
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Image.asset(
              'assets/images/honeycomb.png',
              width: 400,
              fit: BoxFit.contain,
              ),
              
            )
          ],
        ),
      )
    );
  }
}