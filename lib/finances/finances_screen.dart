import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/logic/cubits/get_finances_cubit/get_finances_cubit.dart';
import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/screens/expense.dart';
import 'package:budget_boss_143/finances/screens/your_income.dart';
import 'package:budget_boss_143/finances/widget/pie_chart_painter.dart';
import 'package:budget_boss_143/finances/widget/show_modal_bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetFinancesCubit>().getAllFinancesList();
  }

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
                  setState(() {});
                  context.read<GetFinancesCubit>().getAllFinancesList();
                },
                child: Image.asset('assets/images/ttttim.png', width: 24.w)),
          ],
        ),
        actions: [TimerFinsav()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: Text(
                'Your income',
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: BBColors.white.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: Row(
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
                      context.read<GetFinancesCubit>().getAllFinancesList();
                      setState(() {});
                    },
                    child: Image.asset('assets/images/addwe.png', width: 48.w),
                  ),
                ],
              ),
            ),
            BlocBuilder<GetFinancesCubit, GetFinancesState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Success) {
                  final model = state.financesList
                      .where((item) => item.category != 'Your income')
                      .toList();
                  final modelNow = state.financesList;
                  var grouped = <String, List<FinancesHiveModel>>{};
                  var totalSum = 0.0;
                  List<double> percentages = [];
                  List<Color> colors = [];

                  for (var finance in model) {
                    grouped
                        .putIfAbsent(finance.category, () => [])
                        .add(finance);
                    totalSum += finance.sum;
                  }

                  grouped.forEach((category, finances) {
                    double categorySum =
                        finances.fold(0.0, (sum, item) => sum + item.sum);
                    percentages.add(categorySum);
                    colors.add(Color(finances.first.color));
                  });

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.r),
                        child: Stack(
                          children: [
                            model.isNotEmpty
                                ? CustomPaint(
                                    size: Size(360.w, 360.h),
                                    painter: PieChartPainter(
                                        values: percentages, colors: colors),
                                  )
                                : Container(
                                    height: 360.h,
                                    width: 360.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: BBColors.white),
                                  ),
                            Positioned.fill(
                              child: Center(
                                child: Container(
                                  height: 220.h,
                                  width: 220.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: BBColors.black),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        DateFormat('yyyy')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 24.h,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              BBColors.white.withOpacity(0.6),
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        DateFormat('MMMM')
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 32.h,
                                          fontWeight: FontWeight.w600,
                                          color: BBColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: grouped.entries.map((entry) {
                            var categorySum = entry.value
                                .fold(0.0, (sum, item) => sum + item.sum);
                            var percentage = (categorySum / totalSum * 100)
                                .toStringAsFixed(2);

                            return Container(
                              margin: EdgeInsets.only(
                                right: 12.r,
                                left: grouped.entries.first.key == entry.key
                                    ? 24.r
                                    : 0,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.r, horizontal: 13.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Color(entry.value.first.color),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    entry.key,
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w300,
                                      color: BBColors.white,
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    '$percentage%',
                                    style: TextStyle(
                                      fontSize: 16.h,
                                      fontWeight: FontWeight.w600,
                                      color: BBColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        // height: double.maxFinite,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            vertical: 12.r, horizontal: 24.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                          ),
                          color: BBColors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Recent transactions',
                              style: TextStyle(
                                fontSize: 24.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.black,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            modelNow.isNotEmpty
                                ? ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: index == modelNow.length - 1
                                                ? 20.r
                                                : 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  modelNow[index].category,
                                                  style: TextStyle(
                                                    fontSize: 24.h,
                                                    fontWeight: FontWeight.w500,
                                                    color: BBColors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 4.h),
                                                Text(
                                                  DateFormat('MMMdd, hh:mm')
                                                      .format(
                                                          modelNow[index].data),
                                                  style: TextStyle(
                                                    fontSize: 12.h,
                                                    fontWeight: FontWeight.w400,
                                                    color: BBColors.black
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            modelNow[index].category ==
                                                    'Your income'
                                                ? Text(
                                                    '\$${modelNow[index].sum}',
                                                    style: TextStyle(
                                                      fontSize: 18.h,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: BBColors.green,
                                                    ),
                                                  )
                                                : Text(
                                                    '-\$${modelNow[index].sum}',
                                                    style: TextStyle(
                                                      fontSize: 18.h,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: BBColors.red,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (_, i) =>
                                        Divider(height: 24.h),
                                    itemCount: modelNow.length)
                                : Padding(
                                    padding: EdgeInsets.only(bottom: 20.r),
                                    child: Text(
                                      'No transactions yet',
                                      style: TextStyle(
                                        fontSize: 18.h,
                                        fontWeight: FontWeight.w400,
                                        color: BBColors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is Error) {
                  return Center(
                      child: Text('An error occurred: ${state.error}'));
                } else {
                  return const Center(child: Text('Unexpected state'));
                }
              },
            ),
            // SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class TimerFinsav extends StatefulWidget {
  const TimerFinsav({super.key});

  @override
  State<TimerFinsav> createState() => _TimerFinsavState();
}

class _TimerFinsavState extends State<TimerFinsav> with WidgetsBindingObserver {
  bool sobr = false;
  int secondsButton = 0;

  treeTimer(int days) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('LastTreeUpdate')) {
      final lastUpdateDateTime =
          DateTime.parse(prefs.getString('LastTreeUpdate')!);
      final targetDateTime = lastUpdateDateTime.add(Duration(days: days));
      final difference = targetDateTime.difference(DateTime.now());
      if (difference.inSeconds > 0) {
        if (mounted) {
          setState(() {
            sobr = false;
            secondsButton = difference.inSeconds;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            secondsButton = 0;
            sobr = true;
          });
        }
      }
    } else {
      if (mounted) {
        setState(() {
          secondsButton = 0;
          sobr = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchTimeRAndStartTimer();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  fetchTimeRAndStartTimer() async {
    final timeR = await getTimeR(); // Ensure this function returns an integer
    int days;
    if (timeR == 1) {
      days = 1;
    } else if (timeR == 7) {
      days = 7;
    } else if (timeR == 30) {
      days = 30;
    } else {
      days = 0; // Default case or error handling
    }
    treeTimer(days);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.r),
      child: FutureBuilder(
        future: getTimeR(),
        builder: (context, snapshot) {
          int getTimeR = snapshot.data ?? 0;
          return BbMotion(
            onPressed: () async {
              if (sobr == true) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                        color: BBColors.grey3E3F41,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.r),
                        child: Column(
                          children: [
                            SizedBox(height: 21.h),
                            Container(
                              width: 80.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: BBColors.white,
                              ),
                            ),
                            SizedBox(height: 50.h),
                            Text(
                              'Reminder',
                              style: TextStyle(
                                fontSize: 20.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'Today is payday, don`t forget to add your income.',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w500,
                                color: BBColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 38.h),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return ShowModalBot(
                      trtr: (value) async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString(
                            'LastTreeUpdate', DateTime.now().toString());
                        fetchTimeRAndStartTimer();
                      },
                    );
                  },
                );
                setState(() {});
              }
            },
            child: getTimeR == 0
                ? Image.asset('assets/images/vsdsd.png', width: 24.w)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$getTimeR',
                        style: TextStyle(
                          fontSize: 24.h,
                          fontWeight: FontWeight.w600,
                          color: BBColors.white,
                        ),
                      ),
                      sobr == true
                          ? Image.asset(
                              'assets/images/bosd.png',
                              width: 12.w,
                            )
                          : const SizedBox()
                    ],
                  ),
          );
        },
      ),
    );
  }
}
