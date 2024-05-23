import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_nearby.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_doctor_state.freezed.dart';

@freezed
class NearbyDoctorState with _$NearbyDoctorState {
  const factory NearbyDoctorState({
    @Default(BaseStatus.initial) BaseStatus status,
    DoctorNearby? data,
    String? message,
  }) = _NearbyDoctorState;
}
