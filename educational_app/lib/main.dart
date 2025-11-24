import 'package:flutter/material.dart';
import 'widgets/navigation.dart';
import 'pages/home.dart'; 
import 'pages/games.dart';
// import other pages here...

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  // Pages list
  final pages = [
    const HomePage(),
    const GamePage(),
    const Placeholder(), // Replace with SettingsPage()
    const Placeholder(), // Replace with ProgressPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Itim'),
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: AppNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
