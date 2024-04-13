import 'package:hive_flutter/hive_flutter.dart';

part 'goal_hive_model.g.dart';

@HiveType(typeId: 1)
class GoalHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  int target;
  @HiveField(3)
  int amaunt;
  @HiveField(4)
  String date;
  GoalHiveModel({
    required this.id,
    required this.image,
    required this.target,
    required this.amaunt,
    required this.date,
  });
}
