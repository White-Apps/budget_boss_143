import 'package:hive_flutter/hive_flutter.dart';

part 'goal_hive_model.g.dart';

@HiveType(typeId: 1)
class GoalHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  bool isHistory;
  @HiveField(3)
  double target;
  @HiveField(4)
  double amaunt;
  GoalHiveModel({
    required this.id,
    required this.image,
    required this.isHistory,
    required this.target,
    required this.amaunt,
  });
}
