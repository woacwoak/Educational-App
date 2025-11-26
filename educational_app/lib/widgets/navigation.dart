import 'package:curious_bear/pages/games.dart';
import 'package:curious_bear/pages/home.dart';
import 'package:curious_bear/pages/progress.dart';
import 'package:curious_bear/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xffFFE9C4),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: SvgPicture.asset(
              'assets/navigation_icons/Home.svg',
              width: 39,
              height: 39,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: SvgPicture.asset(
              'assets/navigation_icons/Joystick.svg',
              width: 35,
              height: 35,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
            },
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: SvgPicture.asset(
              'assets/navigation_icons/Gear.svg',
              width: 42,
              height: 42,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: SvgPicture.asset(
              'assets/navigation_icons/Star.svg',
              width: 40,
              height: 40,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressPage()));
            },
          ),
          label: '',
        ),
      ],
    );
  }
}
