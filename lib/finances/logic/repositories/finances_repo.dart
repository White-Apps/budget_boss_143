import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class FinancesRepo {
  Future<List<FinancesHiveModel>> getFinances();
  Future<void> setFinances(FinancesHiveModel financesHiveModel);
}

class FinancesRepoImpl implements FinancesRepo {
  @override
  Future<List<FinancesHiveModel>> getFinances() async {
    final financesBox = await Hive.openBox<FinancesHiveModel>('FinancesBox');
    return financesBox.values.toList();
  }

  @override
  Future<void> setFinances(FinancesHiveModel financesHiveModel) async {
    final financesBox = await Hive.openBox<FinancesHiveModel>('FinancesBox');
    await financesBox.add(financesHiveModel);
  }
}
