import 'package:either_dart/src/either.dart';
import 'package:online_learning/data/data_source/remote/remote_data_source.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/login_model.dart';
import 'package:online_learning/domain/repository/login_repository.dart';

class LoginRepositoryImp extends LoginRepository {
  RemoteDataSource remoteDataSource;

  LoginRepositoryImp(this.remoteDataSource);
  @override
  Future<Either<Failure, LoginModel>> login() async {
    var result = await remoteDataSource.httpRequsest(
        methodType: 'post',
        path: "/login",
        bodyData: {"username": "user", "password": "password"});
    if (result.data['success']==true) {
      return Right(LoginModel.fromJson(result.data));
    }
    return Left(ServerFailure('Login Error'));
  }
}
