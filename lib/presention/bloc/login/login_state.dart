
import 'package:online_learning/data/model/login_model.dart';

abstract class LoginState {
  List<Object?> get props => [];
}

//on Progress
class LoginEmpty extends LoginState {}

class LoginLoading extends LoginState {}

//on Having Error
class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
  @override
  List<Object?> get props => [message];
}

class LoginSuccess extends LoginState {
  final LoginModel responseModel;
  LoginSuccess(this.responseModel);

  @override
  List<Object?> get props =>[responseModel];

  
}
