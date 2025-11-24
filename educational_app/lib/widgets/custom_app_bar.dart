import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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