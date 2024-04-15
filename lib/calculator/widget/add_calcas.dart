import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCalsdvsdvds extends StatefulWidget {
  const AddCalsdvsdvds({
    super.key,
  });
  @override
  State<AddCalsdvsdvds> createState() => _AddCalsdvsdvdsState();
}

class _AddCalsdvsdvdsState extends State<AddCalsdvsdvds> {
  Color color1 = Colors.orange;
  Color color2 = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        color: BBColors.grey3E3F41,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
                'Select background color',
                style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                  color: BBColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: BbMotion(
                      onPressed: () {
                        setState(() {
                          color1 = BBColors.eee1;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee1,
                          border: color1 == BBColors.eee1
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
                          color1 = BBColors.eee2;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee2,
                          border: color1 == BBColors.eee2
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
                          color1 = BBColors.eee3;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee3,
                          border: color1 == BBColors.eee3
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
                          color1 = BBColors.eee4;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee4,
                          border: color1 == BBColors.eee4
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
                          color1 = BBColors.eee5;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee5,
                          border: color1 == BBColors.eee5
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
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: BbMotion(
                      onPressed: () {
                        setState(() {
                          color1 = BBColors.eee6;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee6,
                          border: color1 == BBColors.eee6
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
                          color1 = BBColors.eee7;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee7,
                          border: color1 == BBColors.eee7
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
                          color1 = BBColors.eee8;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee8,
                          border: color1 == BBColors.eee8
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
                          color1 = BBColors.eee9;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee9,
                          border: color1 == BBColors.eee9
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
                          color1 = BBColors.eee10;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee10,
                          border: color1 == BBColors.eee10
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
              SizedBox(height: 24.h),
              Text(
                'Select the color of numbers',
                style: TextStyle(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w500,
                  color: BBColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: BbMotion(
                      onPressed: () {
                        setState(() {
                          color2 = BBColors.eee1;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee1,
                          border: color2 == BBColors.eee1
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
                          color2 = BBColors.eee2;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee2,
                          border: color2 == BBColors.eee2
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
                          color2 = BBColors.eee3;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee3,
                          border: color2 == BBColors.eee3
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
                          color2 = BBColors.eee4;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee4,
                          border: color2 == BBColors.eee4
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
                          color2 = BBColors.eee5;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee5,
                          border: color2 == BBColors.eee5
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
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: BbMotion(
                      onPressed: () {
                        setState(() {
                          color2 = BBColors.eee6;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee6,
                          border: color2 == BBColors.eee6
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
                          color2 = BBColors.eee7;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee7,
                          border: color2 == BBColors.eee7
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
                          color2 = BBColors.eee8;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee8,
                          border: color2 == BBColors.eee8
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
                          color2 = BBColors.eee9;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee9,
                          border: color2 == BBColors.eee9
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
                          color2 = BBColors.eee10;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: BBColors.eee10,
                          border: color2 == BBColors.eee10
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
                  enabled: color1 != Colors.orange && color2 != Colors.orange
                      ? true
                      : false,
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
                    if (color1 != Colors.orange && color2 != Colors.orange) {
                      await setColor1(color1.value);
                      await setColor2(color2.value);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

Future<int> getColor1() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Color1') ?? 4278190080;
}

Future<void> setColor1(int color1) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Color1', color1);
}

Future<int> getColor2() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('Color2') ?? Colors.white.value;
}

Future<void> setColor2(int color2) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('Color2', color2);
}
