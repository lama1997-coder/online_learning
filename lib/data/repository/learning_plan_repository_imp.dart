import 'package:either_dart/src/either.dart';
import 'package:online_learning/data/data_source/remote/remote_data_source.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/learning_plan_model.dart';
import 'package:online_learning/domain/repository/learning_plan_repository.dart';

class LearningPlanRepositoryImp extends LearningPlanRepository {
  final RemoteDataSource remoteDataSource;
  LearningPlanRepositoryImp(this.remoteDataSource);
  @override
  Future<Either<Failure, LearningPlanModel>> learningPlan() async {
    var result = await remoteDataSource.httpRequsest(
        methodType: 'get', path: '/plans', isAuth: true);

    if (result.data['status'] == 200) {
      return Right(LearningPlanModel.fromJson(result.data));
    }
    return Left(ServerFailure('Error Data'));
  }
}
