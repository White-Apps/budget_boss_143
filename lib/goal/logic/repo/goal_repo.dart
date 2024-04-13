import 'package:budget_boss_143/goal/logic/model/goal_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class GoalRepo {
  Future<List<GoalHiveModel>> getGoal();
  Future<void> setGoal(GoalHiveModel goalHiveModel);
  Future<void> updateGoal(int id, bool isActive);
}

class GoalRepoImpl implements GoalRepo {
  @override
  Future<List<GoalHiveModel>> getGoal() async {
    final goalList = await Hive.openBox<GoalHiveModel>('GoalList');
    return goalList.values.toList();
  }

  @override
  Future<void> setGoal(GoalHiveModel goalHiveModel) async {
    final goalList = await Hive.openBox<GoalHiveModel>('GoalList');
    await goalList.add(goalHiveModel);
  }

  @override
  Future<void> updateGoal(int id, bool isHistory) async {
    final goalList = await Hive.openBox<GoalHiveModel>('GoalList');
    List<GoalHiveModel> goalUp =
        goalList.values.where((e) => e.id == id).toList();
    goalUp.first.isHistory = isHistory;
    await goalUp.first.save();
  }
}
