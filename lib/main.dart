import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:budget_boss_143/finances/logic/cubits/get_finances_cubit/get_finances_cubit.dart';
import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/logic/repositories/finances_repo.dart';
import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:budget_boss_143/onbording/spl_scr_buudget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FinancesHiveModelAdapter());
  Hive.registerAdapter(GoalHiveModelAdapter());
  runApp(const BBApp());
}

class BBApp extends StatelessWidget {
  const BBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => GetFinancesCubit(FinancesRepoImpl()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Budget Boss',
          home: const SplashScreenBuudget(),
          theme: ThemeData(
            fontFamily: 'Inter',
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            scaffoldBackgroundColor: BBColors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: BBColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
