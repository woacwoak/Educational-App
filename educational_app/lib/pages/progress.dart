import 'package:curious_bear/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';


class ProgressPage extends StatelessWidget{
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBar(context, "Progress"),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: Color(0xffFFF2D9),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top:20),
            child: Image.asset(
              "assets/images/badge.png",
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Completed games",
            style: TextStyle(
            color: Color(0xff3A2A1E),
            fontSize: 36,
            fontWeight: FontWeight.normal,
            fontFamily: 'Itim'
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgressRow(path: "assets/icons/Math.svg", text: "5+ / 10- / 15"),
                  SizedBox(height: 20),
                  ProgressRow(path: "assets/icons/Brain.svg", text: "3+ / 2- / 5"),
                  SizedBox(height: 20),
                  ProgressRow(path: "assets/icons/Bulb.svg", text: "10+ / 0- / 10"),
                ],
              )
            )
          )
        ],
      )
    );
  }

}

class ProgressRow extends StatelessWidget{
  final String path;
  final String text;
  
  const ProgressRow({
    super.key,
    required this.path,
    required this.text
  });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SvgPicture.asset(
          path,
          height: 60,
          width: 60,
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff3A2A1E),
            fontSize: 36,
            fontWeight: FontWeight.normal,
            fontFamily: 'Itim'
          ),
        ),
        
      ],
    );
  }
}
