import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/logic/cubits/get_finances_cubit/get_finances_cubit.dart';
import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/screens/expense.dart';
import 'package:budget_boss_143/finances/screens/your_income.dart';
import 'package:budget_boss_143/finances/widget/show_modal_bot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

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
                      setState(() {});
                    },
                    child: Image.asset('assets/images/addwe.png', width: 48.w),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 24.h),
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
                  List<Color> colors =
                      []; // Ensure this list gets populated with a color for each category

                  for (var finance in model) {
                    grouped
                        .putIfAbsent(finance.category, () => [])
                        .add(finance);
                    totalSum += finance.sum; // Assuming `amount` is a double
                  }

                  grouped.forEach((category, finances) {
                    double categorySum =
                        finances.fold(0.0, (sum, item) => sum + item.sum);
                    percentages.add(categorySum);
                    colors.add(Color(finances.first
                        .color)); // Assuming `color` is a valid int color code
                  });

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.r),
                        child: Stack(
                          children: [
                            CustomPaint(
                              size: Size(360.w, 360.h),
                              painter: PieChartPainter(
                                  values: percentages, colors: colors),
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
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            DateFormat('MMMdd, hh:mm').format(modelNow[index].data),
                                            style: TextStyle(
                                              fontSize: 12.h,
                                              fontWeight: FontWeight.w400,
                                              color: BBColors.black.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                      modelNow[index].category == 'Your income'
                                          ? Text(
                                              '\$${modelNow[index].sum}',
                                              style: TextStyle(
                                                fontSize: 18.h,
                                                fontWeight: FontWeight.w500,
                                                color: BBColors.green,
                                              ),
                                            )
                                          : Text(
                                              '-\$${modelNow[index].sum}',
                                              style: TextStyle(
                                                fontSize: 18.h,
                                                fontWeight: FontWeight.w500,
                                                color: BBColors.red,
                                              ),
                                            ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, i) =>
                                    Divider(height: 24.h),
                                itemCount: modelNow.length)
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
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double lineWidth;

  PieChartPainter(
      {required this.values, required this.colors, this.lineWidth = 10});

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.fold(0, (sum, item) => sum + item);
    double startRadian = -math.pi / 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    Paint segmentPaint = Paint()..style = PaintingStyle.fill;
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.butt;

    for (int i = 0; i < values.length; i++) {
      double sweepRadian = values[i] / total * 2 * math.pi;
      segmentPaint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        true,
        segmentPaint,
      );

      Offset startLine = center +
          Offset(
            radius * math.cos(startRadian),
            radius * math.sin(startRadian),
          );
      Offset endLine = center +
          Offset(
            radius * math.cos(startRadian + sweepRadian),
            radius * math.sin(startRadian + sweepRadian),
          );

      if (i > 0) {
        canvas.drawLine(center, startLine, linePaint);
      }

      startRadian += sweepRadian;
    }

    Offset endOfLastSegment = center +
        Offset(
          radius * math.cos(startRadian),
          radius * math.sin(startRadian),
        );
    canvas.drawLine(center, endOfLastSegment, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
