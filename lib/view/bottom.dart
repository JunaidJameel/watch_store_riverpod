import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import 'package:watch_store/const/app_colors.dart';
import 'package:watch_store/const/extensions/extension_sizebox.dart';
import 'package:watch_store/view/home/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [HomeView(), Text(''), Text('')];

  void changeTab(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: Platform.isAndroid ? 20 : 0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10)
              ],
              borderRadius: BorderRadius.circular(100),
              color: Colors.black38,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNavButton(
                  icon: Iconsax.home4,
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTap: changeTab,
                ),
                5.hSpace,
                CustomNavButton(
                  icon: Iconsax.shop,
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTap: changeTab,
                  isAddButton: true,
                ),
                5.hSpace,
                CustomNavButton(
                  icon: Iconsax.setting_2,
                  index: 2,
                  selectedIndex: selectedIndex,
                  onTap: changeTab,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNavButton extends StatelessWidget {
  const CustomNavButton({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    this.isAddButton = false,
  });

  final IconData icon;
  final int index;
  final int selectedIndex;
  final bool isAddButton;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final bool isActive = selectedIndex == index;

    return IconButton(
      onPressed: () {
        onTap(index);
      },
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24.sp,
            color: isActive ? AppColors.kWhite : Colors.white54,
          ),
          if (isActive)
            Container(
              width: 6.w,
              height: 6.h,
              margin: EdgeInsets.only(top: 2.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            )
          else if (!isActive)
            SizedBox(height: 8.h),
        ],
      ),
      splashRadius: 28.r,
    );
  }
}
