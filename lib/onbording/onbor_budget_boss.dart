import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/core/bb_wb.dart';
import 'package:budget_boss_143/core/url_wb.dart';
import 'package:budget_boss_143/onbording/widget/onb_it_onddd.dart';
import 'package:budget_boss_143/onbording/widget/rest_wid_svddsdsdi.dart';
import 'package:budget_boss_143/settings/budget_boss_predfb.dart';
import 'package:budget_boss_143/settings/prem_scre_buuger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TiOnbordingBudgetBoss extends StatefulWidget {
  const TiOnbordingBudgetBoss({super.key});

  @override
  State<TiOnbordingBudgetBoss> createState() => _TiOnbordingBudgetBossState();
}

class _TiOnbordingBudgetBossState extends State<TiOnbordingBudgetBoss> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              children: const [
                OnbItOnddd(
                  imageOn: 'assets/images/ioqw1.png',
                  titleOn: 'Take Control of Your\nFinances',
                  decOn: 'Your ultimate tool for managing\npersonal finances!',
                ),
                OnbItOnddd(
                  imageOn: 'assets/images/ioqw2.png',
                  titleOn: 'Achieve Your\nFinancial Goals',
                  decOn:
                      'Start planning for a brighter financial\nfuture today.',
                ),
                OnbItOnddd(
                  imageOn: 'assets/images/ioqw3.png',
                  titleOn: 'Empower Your\nFinancial Decisions',
                  decOn:
                      'Calculate loan payments, savings\ngrowth, investment returns with ease.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: const Color(0xff1780F5),
                    dotColor: const Color.fromARGB(115, 157, 178, 206),
                    dotHeight: 8.h,
                    dotWidth: 9.w,
                  ),
                  axisDirection: Axis.vertical,
                ),
                const Spacer(),
                BbMotion(
                  onPressed: () {
                    if (currantPage == 2) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumTiScreenBudgett(),
                        ),
                        (protected) => false,
                      );
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/images/nextOn.png',
                    width: 120.w,
                    height: 48.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          RestButTiUIqwq(
            onPressTerOfSer: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WebBByWere(
                    title: 'Terms of Service',
                    url: UrlWb.of,
                  ),
                ),
              );
            },
            onPressRest: () {
              restoreBudgetBossPredfb(context);
            },
            onPressPriPol: () {
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
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
