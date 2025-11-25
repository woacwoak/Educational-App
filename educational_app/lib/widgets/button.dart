import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameButton extends StatelessWidget{
  final String text;
  final Color color;
  final String image;
  final Widget gamePage;

  //Constructor
  const GameButton({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.gamePage,
  });

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Itim'),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgPicture.asset(
                    'assets/icons/$image.svg',
                    height: 40,
                    width: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}