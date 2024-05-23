class DoctorNearbyModel {
  final int? id;
  final String? nama;
  final String? jenis;
  final String? tanggal;
  final String? jadwal;
  final String? jarak;

  DoctorNearbyModel({
    this.id,
    this.nama,
    this.jenis,
    this.tanggal,
    this.jadwal,
    this.jarak,
  });

  factory DoctorNearbyModel.fromJson(Map<String, dynamic> json) =>
      DoctorNearbyModel(
        id: json["id"],
        nama: json["nama"],
        jenis: json["jenis"],
        tanggal: json["tanggal"],
        jadwal: json["jadwal"],
        jarak: json["jarak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis": jenis,
        "tanggal": tanggal,
        "jadwal": jadwal,
        "jarak": jarak,
      };
}
