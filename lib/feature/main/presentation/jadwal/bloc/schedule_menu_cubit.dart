import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleMenuCubit extends Cubit<int> {
  ScheduleMenuCubit() : super(1);

  void changeMenu(int index) {
    emit(index);
  }
}
