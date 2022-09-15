import 'dart:convert';

List<Mahasiswa> mahasiswaFromJson(String str) => List<Mahasiswa>.from(json.decode(str).map((x) => Mahasiswa.fromJson(x)));

String mahasiswaToJson(List<Mahasiswa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Mahasiswa {
    Mahasiswa({
        this.id,
        required this.namaMhs,
        required this.stbMhs,
        required this.majorMhs,
        required this.genderMhs,
        required this.addressMhs,
    });

    String? id;
    String namaMhs;
    String stbMhs;
    String majorMhs;
    String genderMhs;
    String addressMhs;

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        id: json["_id"],
        namaMhs: json["nama_mhs"],
        stbMhs: json["stb_mhs"],
        majorMhs: json["major_mhs"],
        genderMhs: json["gender_mhs"],
        addressMhs: json["address_mhs"],
    );

    Map<String, dynamic> toJson() => {
        // "_id": id,
        "nama": namaMhs,
        "stb": stbMhs,
        "major": majorMhs,
        "gender": genderMhs,
        "address": addressMhs,
    };
}
