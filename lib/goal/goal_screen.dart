import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/goal/widget/gl_widget.dart';
import 'package:budget_boss_143/goal/history_screen.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/goal/logic/repo/goal_repo.dart';
import 'package:budget_boss_143/goal/widget/percent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<GoalHiveModel> listTarget = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    listTarget.clear();

    final repoList = await GoalRepoImpl().getGoal();
    listTarget = repoList;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Goal'),
        titleTextStyle: TextStyle(
          fontSize: 28.h,
          fontWeight: FontWeight.w700,
          color: BBColors.white,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.r),
            child: BbMotion(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/historyIcon.png',
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listTarget.isNotEmpty
                ? ListView.separated(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PercentWidget(
                        model: listTarget[index],
                      );
                    },
                    separatorBuilder: (_, i) => SizedBox(height: 16.h),
                    itemCount: listTarget.length,
                  )
                : const SizedBox(),
            SizedBox(
              height: 600.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 12.r),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) => GlWidget(
                  image: listImages[index],
                  setstt: (value) {
                    getData();
                  },
                ),
                itemCount: listImages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> listImages = [
  'assets/images/goal1.png',
  'assets/images/goal2.png',
  'assets/images/goal3.png',
  'assets/images/goal4.png',
  'assets/images/goal5.png',
  'assets/images/goal6.png',
  'assets/images/goal7.png',
  'assets/images/goal8.png',
  'assets/images/goal9.png',
  'assets/images/goal10.png',
  'assets/images/goal11.png',
  'assets/images/goal12.png',
  'assets/images/goal13.png',
  'assets/images/goal14.png',
  'assets/images/goal15.png',
];
