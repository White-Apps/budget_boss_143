import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/goal/logic/repo/goal_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<GoalHiveModel> listHistory = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    listHistory.clear();

    final repoList = await GoalRepoImpl().getGoal();
    listHistory = repoList.where((e) => e.amaunt >= e.target).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const BackButton(
          color: BBColors.white,
        ),
        title: const Text('Goals history'),
        titleTextStyle: TextStyle(
          fontSize: 24.h,
          fontWeight: FontWeight.w600,
          color: BBColors.white,
        ),
      ),
      body: listHistory.isNotEmpty
          ? SafeArea(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HistoryWidget(
                    model: listHistory[index],
                  );
                },
                separatorBuilder: (_, i) => SizedBox(height: 16.h),
                itemCount: listHistory.length,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'History is Empty',
                      style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w500,
                        color: BBColors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.model,
  });
  final GoalHiveModel model;

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
          child: Text(
            model.date,
            style: TextStyle(
                fontSize: 12.h,
                fontWeight: FontWeight.w400,
                color: BBColors.black.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }
}
