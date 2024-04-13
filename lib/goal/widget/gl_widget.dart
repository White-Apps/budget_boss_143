import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/goal/logic/repo/goal_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:intl/intl.dart';

class GlWidget extends StatefulWidget {
  const GlWidget({super.key, required this.image, required this.setstt});
  final String image;
  final ValueChanged setstt;

  @override
  State<GlWidget> createState() => _GlWidgetState();
}

class _GlWidgetState extends State<GlWidget> {
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      child: BbMotion(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 36.h,
            fontWeight: FontWeight.w600,
            color: BBColors.white,
          ),
        ),
        onPressed: () => _handleKeyPress(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BbMotion(
      onPressed: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(24.r),
                  width: double.infinity,
                  height: 680.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff3E3F41),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: BBColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Enter amount',
                        style: TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.w500,
                          color: BBColors.white,
                        ),
                      ),
                      // const BBField(
                      //   hintText: '\',
                      //   maxLine: 1,
                      //   borderColor: Color(0xff3E3F41),
                      // ),
                      Row(
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
                      const Divider(),
                      SizedBox(height: 26.h),
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
                      SizedBox(height: 16.h),
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
                          borderRadius: BorderRadius.circular(32.r),
                          activeTrackColor: Colors.transparent,
                          activeThumbColor: Colors.transparent,
                          thumbPadding: EdgeInsets.all(4.sp),
                          // enabled:false,
                          thumb: IntrinsicWidth(
                            child: Container(
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
                                child: Image.asset('assets/images/nnew.png',
                                    width: 64.w)),
                          ),
                          onSwipe: () async {
                            int res = int.tryParse(input) ?? 0;
                            if (res != 0) {
                              GoalHiveModel todoHiveModel = GoalHiveModel(
                                id: DateTime.now().millisecondsSinceEpoch,
                                image: widget.image,
                                target: res,
                                amaunt: 0,
                                date: DateFormat('d.M.yyyy')
                                    .format(DateTime.now()),
                              );
                              await GoalRepoImpl().setGoal(todoHiveModel);
                              widget.setstt;
                              Navigator.pop(context);
                            } else {
                              // Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          widget.image,
          width: 56.w,
        ),
      ),
    );
  }
}
