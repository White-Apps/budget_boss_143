import 'package:budget_boss_143/finances/logic/models/finances_model.dart';
import 'package:budget_boss_143/finances/logic/repositories/finances_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SetFinancesState {
  const SetFinancesState();

  bool get isLoading => false;
}

class Initial extends SetFinancesState {
  const Initial();
}

class Loading extends SetFinancesState {
  const Loading();

  @override
  bool get isLoading => true;
}

class Error extends SetFinancesState {
  final String error;

  const Error(this.error);
}

class Success extends SetFinancesState {
  const Success();
}

class SetFinancesCubit extends Cubit<SetFinancesState> {
  final FinancesRepo repo;

  SetFinancesCubit(this.repo) : super(const Initial());

  Future<void> setFinances(FinancesHiveModel financesHiveModel) async {
    emit(const Loading());
    try {
      await repo.setFinances(financesHiveModel);
      emit(const Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
