import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/screens/expense_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  String title = '';
  Color color = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BBColors.white,
        ),
        title: Text(
          'Expense',
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: BBColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Select expense category',
              style: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.w500,
                color: BBColors.white,
              ),
            ),
            SizedBox(height: 24.h),
            BbMotion(
              onPressed: () {
                setState(() {
                  title = 'Transport';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Transport'
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
                    'Transport',
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
                  title = 'Food';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Food'
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
                    'Food',
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
                  title = 'Travel';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Travel'
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
                    'Travel',
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
                  title = 'Sport';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Sport'
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
                    'Sport',
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
                  title = 'Health';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Health'
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
                    'Health',
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
                  title = 'Other';
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 12.r),
                decoration: BoxDecoration(
                    border: GradientBoxBorder(
                      gradient: title == 'Other'
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
                    '1Other',
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
            Text(
              'Select color',
              style: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.w500,
                color: BBColors.white,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc1;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc1,
                        border: color == BBColors.ccc1
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc2;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc2,
                        border: color == BBColors.ccc2
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc3;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc3,
                        border: color == BBColors.ccc3
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc4;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc4,
                        border: color == BBColors.ccc4
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc5;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc5,
                        border: color == BBColors.ccc5
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: BbMotion(
                    onPressed: () {
                      setState(() {
                        color = BBColors.ccc6;
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BBColors.ccc6,
                        border: color == BBColors.ccc6
                            ? Border.all(
                                width: 3,
                                color: BBColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 38.h),
            BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseTwo(
                      title: title,
                      color: color,
                    ),
                  ),
                );
              },
              child: Container(
                height: 20,
                width: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
