import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/onbording/spl_scr_buudget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BBApp());
}

class BBApp extends StatelessWidget {
  const BBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Budget Boss',
        home: const SplashScreenBuudget(),
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: BBColors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: BBColors.black,
          ),
        ),
      ),
    );
  }
}
