import 'package:curious_bear/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xffFFF2D9),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Curious Bear',
                      style: TextStyle(
                        color: Color(0xff3A2A1E),
                        fontSize: 60,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Itim'
                        ),
                      ),
                    Text(
                      "Play, Learn, Grow!",
                      style: TextStyle(
                        color: Color(0xffB97B38),
                        fontSize: 42,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Itim'
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(padding:  EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          final appState = context.findAncestorStateOfType<MyAppState>();
                          appState?.setState(() {
                            appState.currentIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6BCB77),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )
                        ),
                        child: Text(  
                          "Play",
                          style: TextStyle(
                            fontSize: 36,
                             color: Colors.white,
                             fontFamily: 'Itim'
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                          Image.asset(
                            'assets/images/bear_home.png',
                            width: 400,
                            fit: BoxFit.contain,
                            ),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}