import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourIncome extends StatefulWidget {
  const YourIncome({super.key});

  @override
  State<YourIncome> createState() => _YourIncomeState();
}

class _YourIncomeState extends State<YourIncome> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String input = '0';

  void _handleKeyPress(String key) {
    setState(
      () {
        if (key == '⌫') {
          if (input.length > 1) {
            input = input.substring(0, input.length - 1);
          } else {
            input = '0';
          }
        } else {
          if (input == '0') {
            input = key;
          } else {
            input += key;
          }
        }
      },
    );
  }

  Widget _buildButton(String title) {
    return BbMotion(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 36.h,
          fontWeight: FontWeight.w600,
          color: BBColors.white,
        ),
      ),
      onPressed: () => _handleKeyPress(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BBColors.white,
        ),
        title: Text(
          'Your income',
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: BBColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 87.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    fontSize: 48.h,
                    fontWeight: FontWeight.w600,
                    color: BBColors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(width: 4.w),
                Flexible(
                  child: Text(
                    input,
                    style: TextStyle(
                      fontSize: 48.h,
                      fontWeight: FontWeight.w600,
                      color: BBColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Divider(height: 0, color: BBColors.white.withOpacity(0.5)),
          ),
          SizedBox(height: 84.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 26.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                color: BBColors.grey3E3F41,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                    ['00', '0', '⌫'],
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          row.map((title) => _buildButton(title)).toList(),
                    ),
                  SizedBox(height: 24.h),
                  Container(
                    // height: 56,
                    margin: EdgeInsets.symmetric(horizontal: 24.r),
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
                      borderRadius: BorderRadius.circular(32.r),
                      activeTrackColor: Colors.transparent,
                      activeThumbColor: Colors.transparent,
                      thumbPadding: EdgeInsets.all(4.sp),
                      // enabled:false,
                      thumb: IntrinsicWidth(
                        child: Container(
                          width: 120.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.r,
                            horizontal: 16.r,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            color: BBColors.white.withOpacity(0.6),
                          ),
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Add income',
                                style: TextStyle(
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.w500,
                                  color: BBColors.black.withOpacity(0.5),
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
                            child: Image.asset('assets/images/nnew.png',
                                width: 64.w)),
                      ),
                      onSwipe: () async {
                        double res = double.tryParse(input) ?? 0;
                        await setIncome(res);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<double> getIncome() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble('Income') ?? 0;
}

Future<void> setIncome(double income) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble('Income', income);
}
