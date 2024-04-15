import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/goal/logic/repo/goal_repo.dart';
import 'package:budget_boss_143/settings/prem_scre_buuger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:intl/intl.dart';

class GlWidget extends StatefulWidget {
  const GlWidget(
      {super.key,
      required this.image,
      required this.setstt,
      required this.chek});
  final String image;
  final ValueChanged setstt;
  final bool chek;
  @override
  State<GlWidget> createState() => _GlWidgetState();
}

class _GlWidgetState extends State<GlWidget> {
  @override
  Widget build(BuildContext context) {
    return BbMotion(
      onPressed: () {
        if (widget.chek == false) {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return GlShowContainer(
                    image: widget.image,
                    setstt: (value) {
                      widget.setstt('');
                    },
                  );
                },
              );
            },
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PremiumTiScreenBudgett(
                isClose: true,
              ),
            ),
          );
        }
      },
      child: widget.chek
          ? Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Opacity(
                    opacity: 0.50,
                    child: Image.asset(
                      widget.image,
                      width: 56.w,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Image.asset(
                      'assets/images/prefd.png',
                      width: 47,
                    ),
                  ),
                )
              ],
            )
          : Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                widget.image,
                width: 56.w,
              ),
            ),
    );
  }
}

class GlShowContainer extends StatefulWidget {
  const GlShowContainer({super.key, required this.image, required this.setstt});
  final String image;
  final ValueChanged setstt;

  @override
  State<GlShowContainer> createState() => _GlShowContainerState();
}

class _GlShowContainerState extends State<GlShowContainer> {
  String input = '0';

  void _handleKeyPress(String key) {
    setState(
      () {
        if (key == '⌫') {
          if (input.length > 1) {
            input = input.substring(0, input.length - 1);
          } else {
            input = '0';
          }
        } else {
          if (input == '0') {
            input = key;
          } else {
            input += key;
          }
        }
      },
    );
  }

  Widget _buildButton(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      child: BbMotion(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 36.h,
            fontWeight: FontWeight.w600,
            color: BBColors.white,
          ),
        ),
        onPressed: () => _handleKeyPress(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      width: double.infinity,
      height: 680.h,
      decoration: const BoxDecoration(
        color: Color(0xff3E3F41),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 80.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: BBColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Enter amount',
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
              color: BBColors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$',
                style: TextStyle(
                  fontSize: 48.h,
                  fontWeight: FontWeight.w600,
                  color: BBColors.white.withOpacity(0.6),
                ),
              ),
              SizedBox(width: 4.w),
              Flexible(
                child: Text(
                  input,
                  style: TextStyle(
                    fontSize: 48.h,
                    fontWeight: FontWeight.w600,
                    color: BBColors.white,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(height: 26.h),
          for (var row in [
            ['1', '2', '3'],
            ['4', '5', '6'],
            ['7', '8', '9'],
            ['00', '0', '⌫'],
          ])
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: row.map((title) => _buildButton(title)).toList(),
            ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffD688F8),
                  Color(0xff14A0FF),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: SwipeButton(
              height: 64.h,
              borderRadius: BorderRadius.circular(32.r),
              activeTrackColor: Colors.transparent,
              activeThumbColor: Colors.transparent,
              thumbPadding: EdgeInsets.all(4.sp),
              thumb: IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.r,
                    horizontal: 16.r,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: BBColors.white.withOpacity(0.6),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w500,
                          color: BBColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 12.r),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/images/nnew.png', width: 64.w)),
              ),
              onSwipe: () async {
                int res = int.tryParse(input) ?? 0;
                if (res != 0) {
                  GoalHiveModel todoHiveModel = GoalHiveModel(
                    id: DateTime.now().millisecondsSinceEpoch,
                    image: widget.image,
                    target: res,
                    amaunt: 0,
                    date: DateFormat('d.M.yyyy').format(DateTime.now()),
                  );
                  await GoalRepoImpl().setGoal(todoHiveModel);
                  Navigator.pop(context);
                  widget.setstt('');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
