import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationCupit extends Cubit<int> {
  PaginationCupit() : super(0);
  updateIndex(int index) {
    emit(index);
  }
}
