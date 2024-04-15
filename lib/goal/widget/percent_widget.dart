import 'dart:async';

import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/finances/screens/your_income.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/goal/logic/repo/goal_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentWidget extends StatefulWidget {
  const PercentWidget({
    super.key,
    required this.model,
    required this.calich,
  });
  final GoalHiveModel model;
  final int calich;

  @override
  State<PercentWidget> createState() => _PercentWidgetState();
}

class _PercentWidgetState extends State<PercentWidget> {
  int amaunt = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(days: 28), (_) => checkDate());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool isLastDayOfMonth(DateTime dateTime) {
    return dateTime.day == 30;
  }

  void checkDate() {
    DateTime now = DateTime.now();
    if (isLastDayOfMonth(now)) {
      getAmunt();
    }
  }

  getAmunt() async {
    double amn = await getIncome();
    amaunt = amn.toInt();
    amaunt = amaunt ~/ widget.calich;
    GoalRepoImpl().updateGoal(widget.model.id, widget.model.amaunt + amaunt);
    await setIncome(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20.r),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                widget.model.image,
                width: 56.w,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.model.amaunt}',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: widget.model.amaunt == 0
                                ? BBColors.black
                                : widget.model.amaunt >= widget.model.target
                                    ? BBColors.green
                                    : BBColors.red,
                          ),
                        ),
                        Text(
                          '/${widget.model.target}',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: BBColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    LinearPercentIndicator(
                      barRadius: const Radius.circular(24),
                      padding: const EdgeInsets.all(0),
                      animation: true,
                      lineHeight: 12,
                      animationDuration: 1500,
                      percent: widget.model.amaunt >= widget.model.target
                          ? 1
                          : widget.model.amaunt *
                              1 /
                              widget.model.target.toDouble(),
                      linearGradient: const LinearGradient(
                        colors: [
                          Color(0xffD688F8),
                          Color(0xff1780F5),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: widget.model.amaunt >= widget.model.target
              ? Image.asset(
                  'assets/icons/hsIcon.png',
                  width: 24.w,
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
