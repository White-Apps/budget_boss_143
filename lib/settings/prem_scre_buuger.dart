import 'package:budget_boss_143/core/bb_bar_down.dart';
import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/onbording/widget/rest_wid_svddsdsdi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumTiScreenBudgett extends StatefulWidget {
  const PremiumTiScreenBudgett({super.key, this.isClose = false});
  final bool isClose;
  @override
  State<PremiumTiScreenBudgett> createState() => _PremiumTiScreenBudgettState();
}

class _PremiumTiScreenBudgettState extends State<PremiumTiScreenBudgett> {
  bool vsddbdbsd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/onnbds.png',
                    width: MediaQuery.of(context).size.width,
                    height: 350.h,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Image.asset(
                        'assets/images/prermdsdgg.png',
                        width: 160.w,
                        height: 160.h,
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (widget.isClose) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BbBarDown(
                                  indexScr: 0,
                                ),
                              ),
                              (protected) => false,
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/images/svdde.png',
                          width: 30.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xffD063FF),
                          Color(0xff1780F5),
                        ],
                      ).createShader(bounds);
                    },
                    child: Text(
                      'Premium',
                      style: TextStyle(
                        fontSize: 32.h,
                        fontWeight: FontWeight.w800,
                        color: BBColors.white,
                        height: 1.1.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: BBColors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/invjsavs.png',
                            width: 32.w,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'Access to all categories in the “Goals” section',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/invjsavs.png',
                            width: 32.w,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'Ability to change colors in the “Calculator” section',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/invjsavs.png',
                            width: 32.w,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'No more Ads',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: BbMotion(
              onPressed: () async {
                // setState(() {
                //   vsddbdbsd = true;
                // });
                // final apphudPaywalls = await Apphud.paywalls();
                // // print(apphudPaywalls?.paywalls.first.products?.first);
                // await Apphud.purchase(
                //   product: apphudPaywalls?.paywalls.first.products?.first,
                // ).whenComplete(
                //   () async {
                //     if (await Apphud.hasPremiumAccess() ||
                //         await Apphud.hasActiveSubscription()) {
                //       await setTennisIqPremsid();
                //       Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(
                //           builder: (_) => const BbBarDown(),
                //         ),
                //         (route) => false,
                //       );
                //     }
                //   },
                // );
                // setState(() {
                //   vsddbdbsd = false;
                // });
              },
              child: Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xffD688F8),
                    Color(0xff14A0FF),
                  ]),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: vsddbdbsd
                      ? const CupertinoActivityIndicator(color: Colors.white)
                      : Text(
                          'Buy Pro Version for \$0,99',
                          style: TextStyle(
                            color: BBColors.white,
                            fontSize: 18.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          RestButTiUIqwq(
            onPressPriPol: () {},
            onPressRest: () {},
            onPressTerOfSer: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
