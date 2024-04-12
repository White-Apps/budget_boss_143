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
      title: fields[1] as String,
      sum: fields[2] as double,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FinancesHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.sum)
      ..writeByte(3)
      ..write(obj.date);
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
