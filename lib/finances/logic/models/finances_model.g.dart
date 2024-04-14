// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finances_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinancesHiveModelAdapter extends TypeAdapter<FinancesHiveModel> {
  @override
  final int typeId = 0;

  @override
  FinancesHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinancesHiveModel(
      id: fields[0] as int,
      category: fields[1] as String,
      sum: fields[2] as double,
      color: fields[3] as int,
      data: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FinancesHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.sum)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinancesHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
