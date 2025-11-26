import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curious_bear/pages/settings.dart';

AppBar appBar(BuildContext context, String title) {

  return AppBar(
    toolbarHeight: 98,
    backgroundColor: const Color(0xffFFE9C4),
    centerTitle: true,
    elevation: 0.0,

    title: Text(
      title,
      style: TextStyle(
        color: Color(0xff3A2A1E),
        fontSize: 40,
        fontFamily: 'Itim',
      ),
    ),

    leading: Padding(
      padding: const EdgeInsets.only(left:10),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/button_back.svg',
          height: 20,
          width: 20,
          fit: BoxFit.contain,
        ),
      ),
    ),

    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xff3A2A1E),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            icon: const Icon(
              Icons.settings,
              size: 20,
              color: Color(0xffFFE9C4),
            ),
          ),
        ),
      ),
    ],
  );
}
