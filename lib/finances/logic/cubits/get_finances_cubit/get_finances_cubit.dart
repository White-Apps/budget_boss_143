import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/logic/repositories/finances_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GetFinancesState {
  const GetFinancesState();
}

class Loading extends GetFinancesState {
  const Loading();
}

class Error extends GetFinancesState {
  final String error;

  const Error(this.error);
}

class Success extends GetFinancesState {
  final List<FinancesHiveModel> financesList;

  const Success(this.financesList);
}

class GetFinancesCubit extends Cubit<GetFinancesState> {
  final FinancesRepo repo;
  GetFinancesCubit(this.repo) : super(const Loading());
  Future<void> getAllFinancesList() async {
    emit(const Loading());
    try {
      final financesList = await repo.getFinances();
      emit(Success(financesList));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
