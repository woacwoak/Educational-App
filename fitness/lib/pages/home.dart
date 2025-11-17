import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 98,
        title: Text(
          'Curious Bear',
          style: TextStyle(
            color: Color(0xff3A2A1E),
            fontSize: 40,
            fontWeight: FontWeight.normal,
            fontFamily: 'Itim'
          ),
        ),
        backgroundColor: Color(0xffFFE9C4),
        centerTitle: true,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.all(15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(
            'assets/icons/button_back.svg',
            height: 20,
            width: 20,
            fit: BoxFit.fill
          ),
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff3A2A1E),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.settings, color: Color(0xff3A2A1E)),
                  onPressed: () {
                    print('Settings button pressed!');
                  }
                )
              )
            )
          ]
          

      ),

    );
  }
}