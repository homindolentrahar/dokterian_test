import 'package:dokterian_test/feature/main/data/model/doctor_schedule_model.dart';

class DoctorSchedule {
  final int? id;
  final String? nama;
  final String? jenis;
  final String? tanggal;
  final String? jadwal;

  DoctorSchedule({
    this.id,
    this.nama,
    this.jenis,
    this.tanggal,
    this.jadwal,
  });

  factory DoctorSchedule.fromModel(DoctorScheduleModel model) {
    return DoctorSchedule(
      id: model.id,
      nama: model.nama,
      jenis: model.jenis,
      tanggal: model.tanggal,
      jadwal: model.jadwal,
    );
  }

  DoctorScheduleModel toModel() => DoctorScheduleModel(
        id: id,
        nama: nama,
        jenis: jenis,
        tanggal: tanggal,
        jadwal: jadwal,
      );
}
