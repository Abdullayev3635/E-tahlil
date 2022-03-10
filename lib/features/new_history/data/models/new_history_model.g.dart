// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewHistoryModelAdapter extends TypeAdapter<NewHistoryModel> {
  @override
  final int typeId = 2;

  @override
  NewHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewHistoryModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      text: fields[2] as String?,
      imageList: (fields[3] as List?)?.cast<ImageList>(),
      regionName: fields[4] as String?,
      sectorId: fields[5] as int?,
      sectorName: fields[6] as String?,
      date: fields[7] as String?,
      orinbosarIshtirokida: fields[8] as String?,
      newCount: fields[9] as int?,
      sendedCount: fields[10] as int?,
    )..imgList = (fields[11] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, NewHistoryModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.imageList)
      ..writeByte(4)
      ..write(obj.regionName)
      ..writeByte(5)
      ..write(obj.sectorId)
      ..writeByte(6)
      ..write(obj.sectorName)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.orinbosarIshtirokida)
      ..writeByte(9)
      ..write(obj.newCount)
      ..writeByte(10)
      ..write(obj.sendedCount)
      ..writeByte(11)
      ..write(obj.imgList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
