// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prof_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfModelAdapter extends TypeAdapter<ProfModel> {
  @override
  final int typeId = 4;

  @override
  ProfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      regionName: fields[2] as String?,
      sectorId: fields[3] as int?,
      phoneNumber: fields[4] as String?,
      viloyatBoyicha: fields[5] as int?,
      tumanBoyicha: fields[6] as int?,
      barchaJonatmalar: fields[7] as int?,
      sectorKotibiKormoqda: fields[8] as int?,
      rejaGrafikBoyicha: fields[9] as int?,
      bajarilishiKerakIshlar: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.regionName)
      ..writeByte(3)
      ..write(obj.sectorId)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.viloyatBoyicha)
      ..writeByte(6)
      ..write(obj.tumanBoyicha)
      ..writeByte(7)
      ..write(obj.barchaJonatmalar)
      ..writeByte(8)
      ..write(obj.sectorKotibiKormoqda)
      ..writeByte(9)
      ..write(obj.rejaGrafikBoyicha)
      ..writeByte(10)
      ..write(obj.bajarilishiKerakIshlar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
