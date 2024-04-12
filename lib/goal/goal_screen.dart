import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/goal/gl_widget.dart';
import 'package:budget_boss_143/goal/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Goal'),
        titleTextStyle: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: BBColors.white,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.r),
            child: BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/historyIcon.png',
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PercentWidget(),
            SizedBox(
              height: 600.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(24.r),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) => GlWidget(
                  image: listImages[index],
                ),
                itemCount: listImages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PercentWidget extends StatelessWidget {
  const PercentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.r),
      padding: EdgeInsets.all(20.r),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/goal1.png',
            width: 56.w,
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '48',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700,
                        color: BBColors.red,
                      ),
                    ),
                    Text(
                      '/800',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w700,
                        color: BBColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(24),
                  padding: const EdgeInsets.all(0),
                  animation: true,
                  lineHeight: 12,
                  animationDuration: 1500,
                  percent: 0.7,
                  linearGradient: const LinearGradient(
                    colors: [
                      Color(0xffD688F8),
                      Color(0xff1780F5),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> listImages = [
  'assets/images/goal1.png',
  'assets/images/goal2.png',
  'assets/images/goal3.png',
  'assets/images/goal4.png',
  'assets/images/goal5.png',
  'assets/images/goal6.png',
  'assets/images/goal7.png',
  'assets/images/goal8.png',
  'assets/images/goal9.png',
  'assets/images/goal10.png',
  'assets/images/goal11.png',
  'assets/images/goal12.png',
  'assets/images/goal13.png',
  'assets/images/goal14.png',
  'assets/images/goal15.png',
];
