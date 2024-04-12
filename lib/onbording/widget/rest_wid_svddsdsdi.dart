import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestButTiUIqwq extends StatelessWidget {
  const RestButTiUIqwq({
    super.key,
    required this.onPressTerOfSer,
    required this.onPressRest,
    required this.onPressPriPol,
    this.isPadding = true,
  });

  final Function() onPressTerOfSer;
  final Function() onPressRest;
  final Function() onPressPriPol;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isPadding) SizedBox(width: 24.w),
        InkWell(
          onTap: onPressTerOfSer,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Color.fromARGB(255, 194, 184, 184),
                ),
              ),
            ),
            child: Text(
              'Terms of Service',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
                color: BBColors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/line.png',
          width: 1.7,
          height: 6.h,
          fit: BoxFit.fill,
        ),
        const Spacer(),
        InkWell(
          onTap: onPressRest,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Color.fromARGB(255, 194, 184, 184),
                ),
              ),
            ),
            child: Text(
              'Restore',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
                color: BBColors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        const Spacer(),
        Image.asset(
          'assets/images/line.png',
          width: 1.7,
          height: 6.h,
          fit: BoxFit.fill,
        ),
        const Spacer(),
        InkWell(
          onTap: onPressPriPol,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: Color.fromARGB(255, 194, 184, 184),
                ),
              ),
            ),
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.h,
                color: BBColors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        if (isPadding) SizedBox(width: 24.w),
      ],
    );
  }
}
