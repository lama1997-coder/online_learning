import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_learning/data/data_source/remote/remote_data_source.dart';
import 'package:online_learning/data/repository/learning_plan_repository_imp.dart';
import 'package:online_learning/data/repository/login_repository_imp.dart';
import 'package:online_learning/domain/repository/learning_plan_repository.dart';
import 'package:online_learning/domain/repository/login_repository.dart';
import 'package:online_learning/domain/usecases/get_plan.dart';
import 'package:online_learning/domain/usecases/login_user.dart';
import 'package:online_learning/presention/bloc/learning_plan/learning_plan_bloc.dart';
import 'package:online_learning/presention/bloc/login/login_bloc.dart';
import 'package:online_learning/presention/bloc/pagination_cupit.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => PaginationCupit());
  locator.registerFactory(() => LoginBloc(locator()));
    locator.registerFactory(() => LearningPlanBloc(locator()));

  //repo
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(locator()));
       locator.registerLazySingleton<LearningPlanRepository>(
      () => LearningPlanRepositoryImp(locator()));
  //useCases
  locator.registerLazySingleton(() => LoginUser(locator()));
    locator.registerLazySingleton(() => GetPlan(locator()));


  //RemoteData
  locator.registerLazySingleton<Dio>(() => Dio());

  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(client: locator()));
}
