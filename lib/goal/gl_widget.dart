import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_field.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlWidget extends StatelessWidget {
  const GlWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return BbMotion(
      onPressed: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
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
                  const BBField(
                    hintText: '\$0',
                    maxLine: 1,
                    borderColor: Color(0xff3E3F41),
                  ),
                  const Divider(),
                  
                ],
              ),
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
          image,
          width: 56.w,
        ),
      ),
    );
  }
}
