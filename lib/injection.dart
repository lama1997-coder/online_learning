import 'package:get_it/get_it.dart';
import 'package:online_learning/presention/bloc/pagination_cupit.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => PaginationCupit());
}
