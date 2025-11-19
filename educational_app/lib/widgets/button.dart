import 'package:flutter/material.dart';

class GameButton extends StatelessWidget{
  final String text;
  final Color color;

  //Constructor
  const GameButton({
    super.key,
    required this.text,
    required this.color
  });

  //Method
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ElevatedButton(
        onPressed: () {
          print('$text Game Selected!');
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