import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlWidget extends StatefulWidget {
  const GlWidget({super.key, required this.image});
  final String image;

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
