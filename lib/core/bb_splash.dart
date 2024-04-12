import 'package:budget_boss_143/core/bb_bar_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    firstOpennnn();
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
              width: 120.w,
            ),
          ),
        ],
      ),
    );
  }

  firstOpennnn() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => const BbBarDown(),
      ),
    );

    // SharedPreferences.getInstance().then(
    //   (prefs) async {
    //     if (!prefs.containsKey('listanalytddkfasdjfsdf')) {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const KnOnbording(),
    //         ),
    //       );
    //       prefs.setDouble('listanalytddkfasdjfsdf', 83491658);
    //       await Future.delayed(const Duration(seconds: 2));
    //       try {
    //         final InAppReview inAppReview = InAppReview.instance;

    //         if (await inAppReview.isAvailable()) {
    //           inAppReview.requestReview();
    //         }
    //       } catch (e) {
    //         throw Exception(e);
    //       }
    //     } else {
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const BbBarDown(
    //             indexScr: 0,
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
