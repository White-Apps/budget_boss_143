import 'package:budget_boss_143/core/bb_bar_down.dart';
import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/logic/cubits/set_finances_cubit/set_finances_cubit.dart';
import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/logic/repositories/finances_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseTwo extends StatefulWidget {
  const ExpenseTwo({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  State<ExpenseTwo> createState() => _ExpenseTwoState();
}

class _ExpenseTwoState extends State<ExpenseTwo> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String input = '0';

  void _handleKeyPress(String key) {
    setState(() {
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
    });
  }

  Widget _buildButton(String title) {
    return BbMotion(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 36.h,
          fontWeight: FontWeight.w600,
          color: BBColors.white,
        ),
      ),
      onPressed: () => _handleKeyPress(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: BBColors.white,
        ),
        title: Text(
          'Expense',
          style: TextStyle(
            fontSize: 24.h,
            fontWeight: FontWeight.w600,
            color: BBColors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),
          Text(
            'Enter amount',
            style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
              color: BBColors.white,
            ),
          ),
          SizedBox(height: 36.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Row(
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
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Divider(height: 0, color: BBColors.white.withOpacity(0.5)),
          ),
          SizedBox(height: 84.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 26.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                color: BBColors.grey3E3F41,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var row in [
                    ['1', '2', '3'],
                    ['4', '5', '6'],
                    ['7', '8', '9'],
                    ['00', '0', '⌫'],
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          row.map((title) => _buildButton(title)).toList(),
                    ),
                  SizedBox(height: 24.h),
                  BlocProvider(
                    create: (context) => SetFinancesCubit(FinancesRepoImpl()),
                    child: BlocConsumer<SetFinancesCubit, SetFinancesState>(
                      listener: (context, state) {
                        if (state is Success) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const BbBarDown(indexScr: 0),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(-1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                    position: offsetAnimation, child: child);
                              },
                            ),
                            (route) => false,
                          );
                        } else if (state is Error) {
                          final errorMessage = state.error;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $errorMessage')),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is Loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return BbMotion(
                          onPressed: () async {
                            if (input != '0') {
                              FinancesHiveModel financesHiveModel =
                                  FinancesHiveModel(
                                id: DateTime.now().millisecondsSinceEpoch,
                                category: widget.title,
                                sum: double.tryParse(input) ?? 0,
                                color: widget.color.value,
                              );
                              context
                                  .read<SetFinancesCubit>()
                                  .setFinances(financesHiveModel);
                            }
                          },
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
