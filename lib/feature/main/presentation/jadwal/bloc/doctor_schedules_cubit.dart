import 'dart:developer';

import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/feature/main/domain/repository/home_repository.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/bloc/doctor_schedules_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorSchedulesCubit extends Cubit<DoctorSchedulesState> {
  DoctorSchedulesCubit(this._repository) : super(const DoctorSchedulesState()) {
    loadData();
  }

  final HomeRepository _repository;

  Future<void> loadData() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final result = await _repository.getDoctorSchedules();
    result.fold(
      (err) {
        log("Error: $err");
        emit(state.copyWith(status: BaseStatus.failure, message: err));
      },
      (data) {
        log("Data: ${data.length}");
        emit(state.copyWith(status: BaseStatus.success, data: data));
      },
    );
  }
}
