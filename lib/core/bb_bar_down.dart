import 'package:budget_boss_143/calculator/calculator_screen.dart';
import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/finances_screen.dart';
import 'package:budget_boss_143/goal/goal_screen.dart';
import 'package:budget_boss_143/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BbBarDownState extends State<BbBarDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[isActive],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 16.r, bottom: 36.r),
        decoration: const BoxDecoration(
          color: BBColors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BbMotion(
              onPressed: () => setState(() => isActive = 0),
              child: SvgPicture.asset(
                'assets/icons/finansIcon.svg',
                color: isActive == 0 ? null : BBColors.white,
                width: 24.w,
              ),
            ),
            BbMotion(
              onPressed: () => setState(() => isActive = 1),
              child: SvgPicture.asset(
                'assets/icons/goalIcon.svg',
                color: isActive == 1 ? null : BBColors.white,
                width: 24.w,
              ),
            ),
            BbMotion(
              onPressed: () => setState(() => isActive = 2),
              child: SvgPicture.asset(
                'assets/icons/calculatorIcon.svg',
                color: isActive == 2 ? null : BBColors.white,
                width: 24.w,
              ),
            ),
            BbMotion(
              onPressed: () => setState(() => isActive = 3),
              child: SvgPicture.asset(
                'assets/icons/settingsIcon.svg',
                color: isActive == 3 ? null : BBColors.white,
                width: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  late int isActive = widget.indexScr;
  final _pages = <Widget>[
    const FinancesScreen(),
    const GoalScreen(),
    const CalculatorScreen(),
    const SettingsScreen(),
  ];
}

class BbBarDown extends StatefulWidget {
  const BbBarDown({super.key, this.indexScr = 0});
  final int indexScr;

  @override
  State<BbBarDown> createState() => BbBarDownState();
}
