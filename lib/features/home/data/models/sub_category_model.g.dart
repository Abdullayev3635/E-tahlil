// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubCategoryModelAdapter extends TypeAdapter<SubCategoryModel> {
  @override
  final int typeId = 1;

  @override
  SubCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategoryModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      categoryName: fields[2] as String?,
      categoryId: fields[3] as int?,
      countWorks: fields[4] as int?,
      status: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SubCategoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categoryName)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.countWorks)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
