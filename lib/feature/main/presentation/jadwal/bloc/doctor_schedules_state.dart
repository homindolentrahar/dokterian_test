import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_schedules_state.freezed.dart';

@freezed
class DoctorSchedulesState with _$DoctorSchedulesState {
  const factory DoctorSchedulesState({
    @Default(BaseStatus.initial) BaseStatus status,
    @Default([]) List<DoctorSchedule> data,
    String? message,
  }) = _DoctorScheduleState;
}
