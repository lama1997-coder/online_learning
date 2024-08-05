import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning/data/data_source/local/storage_helper.dart';
import 'package:online_learning/data/data_source/local/storage_keys.dart';

import '../../../domain/usecases/login_user.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser _userLogin;
  LoginBloc(this._userLogin) : super(LoginEmpty()) {
    on<LoginReloadChange>((event, emit) async {
      emit(LoginLoading());
      final result = await _userLogin.loginUser();
      result.fold((failure) {
        emit(LoginError('Login Fails'));
      }, (data) {
        print('tHE DATA${(data)}');
        if (data.status == null || data.status == 200) {
          print(data.data![0]);

          StorageHelper.set(StorageKeys.fcm_token, data.data![0]);

          emit(LoginSuccess(data));
        } else {
          emit(LoginError('Login Fails'));
        }
      });
    });
  }
}
