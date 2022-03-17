import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int?) onTap;
  const BottomNavBar(
      {required this.currentIndex, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_sharp),
          label: 'group',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email_sharp),
          label: 'DM',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: 'search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'me',
        ),
      ],
    );
  }
}
