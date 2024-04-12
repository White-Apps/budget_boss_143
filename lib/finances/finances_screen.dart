import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/screens/expense.dart';
import 'package:budget_boss_143/finances/screens/your_income.dart';
import 'package:budget_boss_143/finances/widget/show_modal_bot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Finances'),
        titleTextStyle: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: BBColors.white,
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BbMotion(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Expense(),
                    ),
                  );
                  // setState(() {});
                },
                child: Image.asset('assets/images/ttttim.png', width: 24.w)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: FutureBuilder(
              future: getTimeR(),
              builder: (context, snapshot) {
                int getTimeR = snapshot.data ?? 0;
                return BbMotion(
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return const ShowModalBot();
                      },
                    );
                    setState(() {});
                  },
                  child: getTimeR == 0
                      ? Image.asset('assets/images/vsdsd.png', width: 24.w)
                      : Text(
                          '$getTimeR',
                          style: TextStyle(
                            fontSize: 24.h,
                            fontWeight: FontWeight.w600,
                            color: BBColors.white,
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Your income',
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w400,
                color: BBColors.white.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: 48.h,
                          fontWeight: FontWeight.w600,
                          color: BBColors.white.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      FutureBuilder(
                        future: getIncome(),
                        builder: (context, snapshot) {
                          double getIncome = snapshot.data ?? 0;
                          return Expanded(
                            child: Text(
                              getIncome
                                  .toStringAsFixed(2)
                                  .replaceAll(RegExp(r"(\.0*|0*)$"), ""),
                              style: TextStyle(
                                fontSize: 48.h,
                                fontWeight: FontWeight.w600,
                                color: BBColors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                BbMotion(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const YourIncome(),
                      ),
                    );
                    setState(() {});
                  },
                  child: Image.asset('assets/images/addwe.png', width: 48.w),
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
