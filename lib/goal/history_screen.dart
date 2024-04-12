import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackButton(
          color: BBColors.white,
        ),
        title: const Text('Goals history'),
        titleTextStyle: TextStyle(
          fontSize: 24.h,
          fontWeight: FontWeight.w600,
          color: BBColors.white,
        ),
      ),
      body: const Column(),
    );
  }
}
