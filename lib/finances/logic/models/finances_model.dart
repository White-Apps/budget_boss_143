import 'package:hive_flutter/hive_flutter.dart';

part 'finances_model.g.dart';

@HiveType(typeId: 0)
class FinancesHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String category;
  @HiveField(2)
  double sum;
  @HiveField(3)
  int color;

  FinancesHiveModel({
    required this.id,
    required this.category,
    required this.sum,
    required this.color,
  });
}
