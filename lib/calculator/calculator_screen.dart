import 'package:budget_boss_143/calculator/widget/add_calcas.dart';
import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/core/bb_motion.dart';
import 'package:budget_boss_143/finances/screens/your_income.dart';
import 'package:budget_boss_143/settings/budget_boss_predfb.dart';
import 'package:budget_boss_143/settings/prem_scre_buuger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String output = '';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        input = '';
        output = '';
      } else if (value == '⌫') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == '=') {
        output = evaluateExpression(input);
        input += value + output;
      } else if (value == ',') {
        if (!input.endsWith(',')) {
          input += '.';
        }
      } else {
        input += value;
      }
    });
  }

  String evaluateExpression(String expression) {
    try {
      expression = expression.replaceAll(' ', '').replaceAll(',', '.');

      List<double> numbers = [];
      List<String> operators = [];

      String temp = '';

      for (int i = 0; i < expression.length; i++) {
        String currentChar = expression[i];

        if (currentChar == '+' ||
            currentChar == '-' ||
            currentChar == 'X' ||
            currentChar == '÷') {
          numbers.add(double.parse(temp));
          operators.add(currentChar);

          temp = '';
        } else {
          temp += currentChar;
        }
      }

      numbers.add(double.parse(temp));

      while (operators.isNotEmpty) {
        double first = numbers.removeAt(0);
        double second = numbers.removeAt(0);
        String operator = operators.removeAt(0);

        switch (operator) {
          case '+':
            numbers.insert(0, first + second);
            break;
          case '-':
            numbers.insert(0, first - second);
            break;
          case 'X':
            numbers.insert(0, first * second);
            break;
          case '÷':
            if (second == 0) return 'Error';
            numbers.insert(0, first / second);
            break;
        }
      }

      double result = numbers[0];
      return result % 1 == 0
          ? result.toInt().toString()
          : result.toStringAsFixed(2);
    } catch (e) {
      return 'Error';
    }
  }

  Widget createButton(String label, {double? width, double? height}) {
    return BbMotion(
      onPressed: () => onButtonPressed(label),
      child: Container(
        width: width ?? 64.w,
        height: height ?? 64.h,
        margin: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: BBColors.white,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: BBColors.black,
            ),
          ),
        ),
      ),
    );
  }

  double iood = 0;
  @override
  void initState() {
    tybdf();
    super.initState();
  }

  Future<void> tybdf() async {
    double ioodawait = await getIncome();
    setState(() {
      iood = ioodawait;
    });
    if (ioodawait == 0) {
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
                  SizedBox(height: 32.h),
                  Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    '''"You don't have the accumulated amount yet"''',
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
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              color: BBColors.grey3E3F41,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
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
                  SizedBox(height: 32.h),
                  Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    '''"Would you like to calculate the total amount you have accumulated for the goal?"''',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: BBColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: BbMotion(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffD688F8),
                                  Color(0xff14A0FF),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Refuse',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w500,
                                  color: BBColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 22.w),
                      Expanded(
                        child: BbMotion(
                          onPressed: () {
                            setState(() {
                              input = ioodawait
                                  .toStringAsFixed(2)
                                  .replaceAll(RegExp(r"(\.0*|0*)$"), "");
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffD688F8),
                                  Color(0xff14A0FF),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Accept',
                                style: TextStyle(
                                  fontSize: 18.h,
                                  fontWeight: FontWeight.w500,
                                  color: BBColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getColor1(),
        builder: (context, snapshot) {
          int getColor1 = snapshot.data ?? 4278190080;
          return Scaffold(
            backgroundColor: Color(getColor1),
            appBar: AppBar(
              backgroundColor: Color(getColor1),
              scrolledUnderElevation: 0,
              title: const Text('Calculator'),
              titleTextStyle: TextStyle(
                fontSize: 28.h,
                fontWeight: FontWeight.w700,
                color: BBColors.white,
              ),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.r),
                    child: FutureBuilder(
                      future: getBudgetBossPredfb(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (!snapshot.data!) {
                            return BbMotion(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PremiumTiScreenBudgett(
                                      isClose: true,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/fdf.png',
                                      width: 24.w),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Image.asset(
                                        'assets/images/hsbdvsd.png',
                                        width: 16.w),
                                  ),
                                ],
                              ),
                            );
                          }
                          return BbMotion(
                            onPressed: () async {
                              await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return AddCalsdvsdvds();
                                },
                              );
                              setState(() {});
                            },
                            child: Image.asset('assets/images/fdf.png',
                                width: 24.w),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 25.r),
                  child: BbMotion(
                      onPressed: () async {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24.r),
                                  topRight: Radius.circular(24.r),
                                ),
                                color: BBColors.grey3E3F41,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                child: Column(
                                  children: [
                                    SizedBox(height: 21.h),
                                    Container(
                                      width: 80.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                        color: BBColors.white,
                                      ),
                                    ),
                                    SizedBox(height: 32.h),
                                    Text(
                                      'Info',
                                      style: TextStyle(
                                        fontSize: 20.h,
                                        fontWeight: FontWeight.w500,
                                        color: BBColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      '''"Would you like to calculate the total amount you have accumulated for the goal?"''',
                                      style: TextStyle(
                                        fontSize: 16.h,
                                        fontWeight: FontWeight.w500,
                                        color: BBColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 32.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: BbMotion(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.r),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24.r),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xffD688F8),
                                                    Color(0xff14A0FF),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Refuse',
                                                  style: TextStyle(
                                                    fontSize: 18.h,
                                                    fontWeight: FontWeight.w500,
                                                    color: BBColors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 22.w),
                                        Expanded(
                                          child: BbMotion(
                                            onPressed: () {
                                              setState(() {
                                                input = iood
                                                    .toStringAsFixed(2)
                                                    .replaceAll(
                                                        RegExp(r"(\.0*|0*)$"),
                                                        "");
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.r),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24.r),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xffD688F8),
                                                    Color(0xff14A0FF),
                                                  ],
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Accept',
                                                  style: TextStyle(
                                                    fontSize: 18.h,
                                                    fontWeight: FontWeight.w500,
                                                    color: BBColors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 32.h),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        setState(() {});
                      },
                      child:
                          Image.asset('assets/images/addCal.png', width: 24.w)),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: Column(
                children: [
                  FutureBuilder(
                      future: getColor2(),
                      builder: (context, snapshot) {
                        int getColor2 = snapshot.data ?? Colors.white.value;
                        return Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              child: Text(
                                input,
                                style: TextStyle(
                                  fontSize: 48.h,
                                  fontWeight: FontWeight.w500,
                                  color: Color(getColor2),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createButton('7'),
                      createButton('8'),
                      createButton('9'),
                      createButton('AC'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createButton('4'),
                      createButton('5'),
                      createButton('6'),
                      createButton('X'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      createButton('1'),
                      createButton('2'),
                      createButton('3'),
                      createButton('÷'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                createButton(','),
                                createButton('0'),
                                createButton('.'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                createButton('='),
                                createButton('+'),
                                createButton('-'),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: createButton('⌫', height: 160.h)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
