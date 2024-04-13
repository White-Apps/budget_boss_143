// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalHiveModelAdapter extends TypeAdapter<GoalHiveModel> {
  @override
  final int typeId = 1;

  @override
  GoalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalHiveModel(
      id: fields[0] as int,
      image: fields[1] as String,
      isHistory: fields[2] as bool,
      target: fields[3] as double,
      amaunt: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GoalHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.isHistory)
      ..writeByte(3)
      ..write(obj.target)
      ..writeByte(4)
      ..write(obj.amaunt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
