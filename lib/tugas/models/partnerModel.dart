import 'dart:convert';

class PartnerModel {
  int? idPartner;
  String? namaPartner;
  JenisKelamin? jenisKelamin;
  Kategori? kategori;
  String? fotoPartner;
  String? bioPartner;

  PartnerModel({
    this.idPartner,
    this.namaPartner,
    this.jenisKelamin,
    this.kategori,
    this.fotoPartner,
    this.bioPartner,
  });

  factory PartnerModel.fromRawJson(String str) =>
      PartnerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
    idPartner: json["idPartner"],
    namaPartner: json["namaPartner"],
    jenisKelamin: jenisKelaminValues.map[json["jenisKelamin"]]!,
    kategori: kategoriValues.map[json["kategori"]]!,
    fotoPartner: json["fotoPartner"],
    bioPartner: json["bioPartner"],
  );

  Map<String, dynamic> toJson() => {
    "idPartner": idPartner,
    "namaPartner": namaPartner,
    "jenisKelamin": jenisKelaminValues.reverse[jenisKelamin],
    "kategori": kategoriValues.reverse[kategori],
    "fotoPartner": fotoPartner,
    "bioPartner": bioPartner,
  };
}

enum JenisKelamin { LAKI_LAKI, PEREMPUAN }

final jenisKelaminValues = EnumValues({
  "Laki - Laki": JenisKelamin.LAKI_LAKI,
  "Perempuan": JenisKelamin.PEREMPUAN,
});

enum Kategori { REAL_LIFE, VIRTUAL }

final kategoriValues = EnumValues({
  "Real Life": Kategori.REAL_LIFE,
  "Virtual": Kategori.VIRTUAL,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
