import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentWidget extends StatelessWidget {
  const PercentWidget({
    super.key,
    required this.model,
  });
  final GoalHiveModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // GoalRepoImpl().updateGoal(model.id, model.amaunt + 50);
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
                model.image,
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
                          '${model.amaunt}',
                          style: TextStyle(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w700,
                            color: model.amaunt == 0
                                ? BBColors.black
                                : model.amaunt >= model.target
                                    ? BBColors.green
                                    : BBColors.red,
                          ),
                        ),
                        Text(
                          '/${model.target}',
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
                      percent: model.amaunt >= model.target
                          ? 1
                          : model.amaunt * 1 / model.target.toDouble(),
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
          child: model.amaunt >= model.target
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
