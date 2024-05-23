import 'dart:developer';

import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/feature/main/domain/repository/home_repository.dart';
import 'package:dokterian_test/feature/main/presentation/home/bloc/nearby_doctor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearbyDoctorCubit extends Cubit<NearbyDoctorState> {
  NearbyDoctorCubit(this._repository) : super(const NearbyDoctorState()) {
    loadData();
  }

  final HomeRepository _repository;

  Future<void> loadData() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final result = await _repository.getNearbyDoctor();
    result.fold(
      (err) {
        log("Error: $err");
        emit(state.copyWith(status: BaseStatus.failure, message: err));
      },
      (data) {
        log("Data: ${data.id}");
        emit(state.copyWith(status: BaseStatus.success, data: data));
      },
    );
  }
}
