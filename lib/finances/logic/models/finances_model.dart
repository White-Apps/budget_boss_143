import 'package:hive_flutter/hive_flutter.dart';

part 'finances_model.g.dart';

@HiveType(typeId: 0)
class FinancesHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double sum;
  @HiveField(3)
  DateTime date;

  FinancesHiveModel({
    required this.id,
    required this.title,
    required this.sum,
    required this.date,
  });
  @override
  String toString() {
    return '$id, $title, $date';
  }
}
