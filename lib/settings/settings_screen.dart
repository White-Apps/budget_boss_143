import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Settings'),
        titleTextStyle: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: BBColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: const Column(),
      ),
    );
  }
}
