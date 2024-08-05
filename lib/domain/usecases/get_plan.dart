import 'package:either_dart/either.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/learning_plan_model.dart';
import 'package:online_learning/domain/repository/learning_plan_repository.dart';

class GetPlan {
  final LearningPlanRepository learningPlanRepository;

  GetPlan(this.learningPlanRepository);

  Future<Either<Failure, LearningPlanModel>> getLeaningPlan() {
    return learningPlanRepository.learningPlan();
  }
}
