// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class addExpenseAdapter extends TypeAdapter<addExpense> {
  @override
  final int typeId = 1;

  @override
  addExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return addExpense(
      category: fields[1] as String,
      expense: fields[2] as String,
      amount: fields[3] as String,
      datetime: fields[4] as DateTime,
      note: fields[5] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, addExpense obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.expense)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.datetime)
      ..writeByte(5)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is addExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class addIncomeAdapter extends TypeAdapter<addIncome> {
  @override
  final int typeId = 2;

  @override
  addIncome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return addIncome(
      category: fields[1] as String,
      income: fields[2] as String,
      amount: fields[3] as String,
      datetime: fields[4] as DateTime,
      note: fields[5] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, addIncome obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.income)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.datetime)
      ..writeByte(5)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is addIncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class userAdapter extends TypeAdapter<user> {
  @override
  final int typeId = 3;

  @override
  user read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return user(
      name: fields[1] as String,
      phn: fields[2] as String,
      mail: fields[3] as String,
      password: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, user obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phn)
      ..writeByte(3)
      ..write(obj.mail)
      ..writeByte(4)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is userAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
