// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImgModelAdapter extends TypeAdapter<ImgModel> {
  @override
  final int typeId = 6;

  @override
  ImgModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImgModel(
      latLang: fields[0] as String?,
      sana: fields[1] as String?,
      image: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImgModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latLang)
      ..writeByte(1)
      ..write(obj.sana)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImgModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
