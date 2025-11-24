import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Color(0xFFCC9A5E),
        highlightColor: Color(0xFFCC9A5E),
      ),
      child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffFFE9C4),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      
      
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navigation_icons/Home.svg',
            width: 39,
            height: 39,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navigation_icons/Joystick.svg',
            width: 35,
            height: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navigation_icons/Gear.svg',
            width: 42,
            height: 42,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/navigation_icons/Star.svg',
            width: 40,
            height: 40,
          ),
          label: '',
        ),
      ],
    )
    );
  }
}
