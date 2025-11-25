import 'package:flutter/material.dart';

class GameButton extends StatelessWidget{
  final String text;
  final Color color;

  final Widget gamePage;

  //Constructor
  const GameButton({
    super.key,
    required this.text,
    required this.color,
    required this.gamePage,
  });

  //Method
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => gamePage),//how to transition to different game pages based on game selected
            
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Itim'),
        ),
      ),
    );
  }


}