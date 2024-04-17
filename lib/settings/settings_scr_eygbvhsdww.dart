import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/core/bb_wb.dart';
import 'package:budget_boss_143/core/url_wb.dart';
import 'package:budget_boss_143/settings/budget_boss_predfb.dart';
import 'package:budget_boss_143/settings/prem_scre_buuger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScrEygbvhsdww extends StatelessWidget {
  const SettingsScrEygbvhsdww({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Settings'),
        titleTextStyle: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: BBColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBByWere(
                      title: 'Privacy Policy',
                      url: UrlWb.pri,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 24.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ]),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: BBColors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/images/nneref.png',
                      width: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBByWere(
                      title: 'Terms of Use',
                      url: UrlWb.of,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 24.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ]),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: BBColors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/images/nneref.png',
                      width: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBByWere(
                      title: 'Support',
                      url: UrlWb.spp,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 24.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ]),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        color: BBColors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/images/nneref.png',
                      width: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BbMotion(
              onPressed: () {
                Share.share(
                    'https://apps.apple.com/us/app/budgetboss-expenses-finances/id6498550611');
              },
              child: Container(
                width: double.infinity,
                height: 60.h,
                padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 24.r),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ]),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share App',
                      style: TextStyle(
                        color: BBColors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      'assets/images/nneref.png',
                      width: 24.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            FutureBuilder(
              future: getBudgetBossPredfb(),
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.data!) {
                  return BbMotion(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumTiScreenBudgett(
                            isClose: true,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.r, horizontal: 24.r),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xffD688F8),
                          Color(0xff14A0FF),
                        ]),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Buy Premium for \$0.99',
                            style: TextStyle(
                              color: BBColors.white,
                              fontSize: 18.h,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Image.asset(
                            'assets/images/nneref.png',
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
