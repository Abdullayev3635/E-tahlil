// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'not_send_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotSendModelAdapter extends TypeAdapter<NotSendModel> {
  @override
  final int typeId = 5;

  @override
  NotSendModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotSendModel(
      userId: fields[0] as String?,
      categoryId: fields[1] as String?,
      subCategoryId: fields[2] as String?,
      orinbosarIshtirokida: fields[3] as String?,
      title: fields[4] as String?,
      text: fields[5] as String?,
      imagesList: (fields[6] as List?)?.cast<ImgModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, NotSendModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.subCategoryId)
      ..writeByte(3)
      ..write(obj.orinbosarIshtirokida)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.imagesList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotSendModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
