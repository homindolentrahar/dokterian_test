import 'package:dokterian_test/feature/main/data/model/doctor_nearby_model.dart';

class DoctorNearby {
  final int? id;
  final String? nama;
  final String? jenis;
  final String? tanggal;
  final String? jadwal;
  final String? jarak;

  DoctorNearby({
    required this.id,
    required this.nama,
    required this.jenis,
    required this.tanggal,
    required this.jadwal,
    required this.jarak,
  });

  factory DoctorNearby.fromModel(DoctorNearbyModel model) {
    return DoctorNearby(
      id: model.id,
      nama: model.nama,
      jenis: model.jenis,
      tanggal: model.tanggal,
      jadwal: model.jadwal,
      jarak: model.jarak,
    );
  }

  DoctorNearbyModel toModel() => DoctorNearbyModel(
        id: id,
        nama: nama,
        jenis: jenis,
        tanggal: tanggal,
        jadwal: jadwal,
        jarak: jarak,
      );
}
