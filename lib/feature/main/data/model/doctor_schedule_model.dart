class DoctorScheduleModel {
  final int? id;
  final String? nama;
  final String? jenis;
  final String? tanggal;
  final String? jadwal;

  DoctorScheduleModel({
    this.id,
    this.nama,
    this.jenis,
    this.tanggal,
    this.jadwal,
  });

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) =>
      DoctorScheduleModel(
        id: json["id"],
        nama: json["nama"],
        jenis: json["jenis"],
        tanggal: json["tanggal"],
        jadwal: json["jadwal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis": jenis,
        "tanggal": tanggal,
        "jadwal": jadwal,
      };
}
