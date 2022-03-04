class ProfModel {
  int? id;
  String? name;
  String? regionName;
  int? sectorId;
  String? phoneNumber;
  int? viloyatBoyicha;
  int? tumanBoyicha;
  int? barchaJonatmalar;
  int? sectorKotibiKormoqda;
  int? rejaGrafikBoyicha;
  int? bajarilishiKerakIshlar;

  ProfModel(
      {required this.id,
      required this.name,
      required this.regionName,
      required this.sectorId,
      required this.phoneNumber,
      required this.viloyatBoyicha,
      required this.tumanBoyicha,
      required this.barchaJonatmalar,
      required this.sectorKotibiKormoqda,
      required this.rejaGrafikBoyicha,
      required this.bajarilishiKerakIshlar});

  ProfModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regionName = json['region_name'];
    sectorId = json['sector_id'];
    phoneNumber = json['phone_number'];
    viloyatBoyicha = json['viloyat_boyicha'];
    tumanBoyicha = json['tuman_boyicha'];
    barchaJonatmalar = json['barcha_jonatmalar'];
    sectorKotibiKormoqda = json['sector_kotibi_kormoqda'];
    rejaGrafikBoyicha = json['reja_grafik_boyicha'];
    bajarilishiKerakIshlar = json['bajarilishi_kerak_ishlar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['region_name'] = regionName;
    data['sector_id'] = sectorId;
    data['phone_number'] = phoneNumber;
    data['viloyat_boyicha'] = viloyatBoyicha;
    data['tuman_boyicha'] = tumanBoyicha;
    data['barcha_jonatmalar'] = barchaJonatmalar;
    data['sector_kotibi_kormoqda'] = sectorKotibiKormoqda;
    data['reja_grafik_boyicha'] = rejaGrafikBoyicha;
    data['bajarilishi_kerak_ishlar'] = bajarilishiKerakIshlar;
    return data;
  }
}
