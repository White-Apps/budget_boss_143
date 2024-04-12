import 'package:budget_boss_143/core/bb_bar_down.dart';
import 'package:budget_boss_143/onbording/onbor_budget_boss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenBuudget extends StatefulWidget {
  const SplashScreenBuudget({super.key});

  @override
  State<SplashScreenBuudget> createState() => _SplashScreenBuudgetState();
}

class _SplashScreenBuudgetState extends State<SplashScreenBuudget> {
  @override
  void initState() {
    vsdvsbree();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 180.w,
              height: 108.h,
            ),
          ),
        ],
      ),
    );
  }

  vsdvsbree() async {
    await Future.delayed(const Duration(milliseconds: 1357));

    SharedPreferences.getInstance().then(
      (prefs) async {
        if (!prefs.containsKey('njjjdkvsdsd')) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const TiOnbordingBudgetBoss(),
            ),
          );
          prefs.setDouble('njjjdkvsdsd', 71836254);
          await Future.delayed(const Duration(seconds: 3));
          try {
            final InAppReview inAppReview = InAppReview.instance;

            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            }
          } catch (e) {
            throw Exception(e);
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const TiOnbordingBudgetBoss()
                //BbBarDown(
                //   indexScr: 0,
                // ),
                ),
          );
        }
      },
    );
  }
}
