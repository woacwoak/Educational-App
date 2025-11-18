import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Game 1 Selected!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6BCB77),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                  child: const Text(
                    "Math",
                    style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Itim'),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar( 
      toolbarHeight: 98,
      title: Text(
        'Curious Bear',
        style: TextStyle(
          color: Color(0xff3A2A1E),
          fontSize: 40,
          fontWeight: FontWeight.normal,
          fontFamily: 'Itim',
        ),
      ),
      backgroundColor: Color(0xffFFE9C4),
      centerTitle: true,
      elevation: 0.0,

      leading: GestureDetector(
        onTap: () {

        },
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/button_back.svg',
            height: 20,
            width: 20,
            fit: BoxFit.fill,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff3A2A1E),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                print('Settings button pressed!');
              },
              icon: Icon(
                Icons.settings,
                color: Color(0xffFFE9C4),
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );





  }
}
