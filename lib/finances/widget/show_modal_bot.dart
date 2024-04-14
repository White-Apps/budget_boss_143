import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowModalBot extends StatefulWidget {
  const ShowModalBot({
    super.key,
    required this.trtr,
  });
  final ValueChanged trtr;
  @override
  State<ShowModalBot> createState() => _ShowModalBotState();
}

class _ShowModalBotState extends State<ShowModalBot> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        color: BBColors.grey3E3F41,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r),
        child: Column(
          children: [
            SizedBox(height: 21.h),
            Container(
              width: 80.w,
              height: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: BBColors.white,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              '''"Choose the frequency of income generation: daily, weekly or monthly."''',
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w500,
                color: BBColors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 38.h),
            BbMotion(
              onPressed: () {
                setState(() {
                  title = '1 day';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == '1 day'
                          ? const LinearGradient(colors: [
                              Color(0xffE0A0FC),
                              Color(0xff1780F5),
                            ])
                          : const LinearGradient(colors: [
                              BBColors.white,
                              BBColors.white,
                            ]),
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    '1 day',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BbMotion(
              onPressed: () {
                setState(() {
                  title = '7 days';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == '7 days'
                          ? const LinearGradient(colors: [
                              Color(0xffE0A0FC),
                              Color(0xff1780F5),
                            ])
                          : const LinearGradient(colors: [
                              BBColors.white,
                              BBColors.white,
                            ]),
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    '7 days',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BbMotion(
              onPressed: () {
                setState(() {
                  title = '30 days';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == '30 days'
                          ? const LinearGradient(colors: [
                              Color(0xffE0A0FC),
                              Color(0xff1780F5),
                            ])
                          : const LinearGradient(colors: [
                              BBColors.white,
                              BBColors.white,
                            ]),
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    '30 days',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: SwipeButton(
                height: 64.h,
                borderRadius: BorderRadius.circular(28.r),
                activeTrackColor: Colors.transparent,
                activeThumbColor: Colors.transparent,
                thumbPadding: EdgeInsets.all(4.sp),
                enabled: title != '' ? true : false,
                thumb: IntrinsicWidth(
                  child: Container(
                    width: 120.w,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.r,
                      horizontal: 16.r,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      color: BBColors.white,
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: BBColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 12.r),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child:
                          Image.asset('assets/images/nnew.png', width: 64.w)),
                ),
                onSwipe: () async {
                  if (title != '') {
                    if (title == '1 day') {
                      await setTimeR(1);
                    } else if (title == '7 days') {
                      await setTimeR(7);
                    } else {
                      await setTimeR(30);
                    }
                    widget.trtr('');
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            SizedBox(height: 38.h),
          ],
        ),
      ),
    );
  }
}

Future<int> getTimeR() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('TimeR') ?? 0;
}

Future<void> setTimeR(int timeR) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('TimeR', timeR);
}
