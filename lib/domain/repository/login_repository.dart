import 'package:either_dart/either.dart';
import 'package:online_learning/data/model/failure.dart';
import 'package:online_learning/data/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure,LoginModel>> login();
}
