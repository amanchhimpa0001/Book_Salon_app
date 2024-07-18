import 'package:book_salon_app/Home_screen/home_screen.dart';
import 'package:book_salon_app/Profile_and_Settings/Profile.dart';
import 'package:flutter/material.dart';

import '../helpers/color_sheet.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    HomeView(),
    profile_screen(),
    profile_screen(),
    profile_screen(),
    profile_screen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.yellow,
          type: BottomNavigationBarType.fixed,
          onTap: (v) => setState(() {
            currentIndex = v;
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online_outlined), label: "My Book"),
            BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Index"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          backgroundColor: AppColors.whiteColor,
          elevation: 2,
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
