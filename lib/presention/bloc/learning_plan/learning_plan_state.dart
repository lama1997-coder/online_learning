import 'package:online_learning/data/model/learning_plan_model.dart';

abstract class LearningPlanState {
  List<Object?> get props => [];
}

//on Progress
class LearningPlanEmpty extends LearningPlanState {}

class LearningPlanLoading extends LearningPlanState {}

//on Having Error
class LearningPlanError extends LearningPlanState {
  final String message;
  LearningPlanError(this.message);
  @override
  List<Object?> get props => [message];
}

class LearningPlanSuccess extends LearningPlanState {
  final LearningPlanModel learningPlanList;
  LearningPlanSuccess(this.learningPlanList);

  @override
  List<Object?> get props => [learningPlanList];
}
