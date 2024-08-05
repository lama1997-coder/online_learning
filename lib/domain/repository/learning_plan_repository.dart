import 'package:either_dart/either.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/learning_plan_model.dart';

abstract class LearningPlanRepository {
  Future<Either<Failure, LearningPlanModel>> learningPlan();
}
