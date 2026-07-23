import 'package:flutter/material.dart';
import 'tabs/home_Screen.dart';
import 'tabs/project_Screen.dart';
import 'tabs/task_Screen.dart';
import 'tabs/timer_Screen.dart';
import 'tabs/profile_Screen.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:workplace/core/constants/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomeTab(),
    ProjectTab(),
    TaskTab(),
    TimerTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,


        backgroundColor: Colors.white,
        elevation: 8,

        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,

        selectedFontSize: 13,
        unselectedFontSize: 12,

        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),

        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/project_icon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Project",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/task_icon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Task",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/timer_icon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 3 ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Timer",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 4 ? AppColors.primary : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
