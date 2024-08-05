import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning/data/data_source/local/storage_helper.dart';
import 'package:online_learning/data/data_source/local/storage_keys.dart';
import 'package:online_learning/domain/usecases/get_plan.dart';

import '../../../domain/usecases/login_user.dart';
import 'learning_plan_event.dart';
import 'learning_plan_state.dart';

class LearningPlanBloc extends Bloc<LearningPlanEvent, LearningPlanState> {
  final GetPlan _getPlan;
  LearningPlanBloc(this._getPlan) : super(LearningPlanEmpty()) {
    on<LearningPlanReloadChange>((event, emit) async {
      emit(LearningPlanLoading());
      final result = await _getPlan.getLeaningPlan();
      result.fold((failure) {
        emit(LearningPlanError('LearningPlan Fails'));
      }, (data) async {
        print('tHE DATA${(data)}');
        if (data.status == null || data.status == 200) {
          print(data.data![0]);


          emit(LearningPlanSuccess(data));
        } else {        emit(LearningPlanError('Login Fails'));
}
      });
    });
  }
}
