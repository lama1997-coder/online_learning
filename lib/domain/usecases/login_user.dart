import 'package:either_dart/either.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/login_model.dart';
import 'package:online_learning/domain/repository/login_repository.dart';

class LoginUser {
  final LoginRepository loginRepository;

  LoginUser(this.loginRepository);

  Future<Either<Failure, LoginModel>> loginUser() async {
    return loginRepository.login();
  }
}
