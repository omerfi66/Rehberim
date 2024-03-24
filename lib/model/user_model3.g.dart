// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model3.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModel3Adapter extends TypeAdapter<UserModel3> {
  @override
  final int typeId = 1;

  @override
  UserModel3 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel3(
      id: fields[0] as String,
      userName: fields[1] as String,
      userNumber: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel3 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel3Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
