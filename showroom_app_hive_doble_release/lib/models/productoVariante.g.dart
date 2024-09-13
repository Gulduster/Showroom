// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productoVariante.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductoVarianteAdapter extends TypeAdapter<ProductoVariante> {
  @override
  final int typeId = 1;

  @override
  ProductoVariante read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductoVariante(
      itemId: fields[0] as int,
      codItem: fields[1] as String,
      monedaId: fields[2] as int,
      signo: fields[3] as String,
      precioVentaActual: fields[4] as double,
      precioIvaIncluido: fields[5] as double,
      existenciaActual: fields[6] as int,
      existenciaTotal: fields[7] as int,
      ivaId: fields[8] as int,
      valor: fields[9] as int,
      codColor: fields[10] as String,
      color: fields[11] as String,
      talle: fields[12] as String,
      disponible: fields[13] as int,
      colorHexCode: fields[14] as int,
      r: fields[15] as int,
      g: fields[16] as int,
      b: fields[17] as int,
      imagenes: (fields[18] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductoVariante obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.itemId)
      ..writeByte(1)
      ..write(obj.codItem)
      ..writeByte(2)
      ..write(obj.monedaId)
      ..writeByte(3)
      ..write(obj.signo)
      ..writeByte(4)
      ..write(obj.precioVentaActual)
      ..writeByte(5)
      ..write(obj.precioIvaIncluido)
      ..writeByte(6)
      ..write(obj.existenciaActual)
      ..writeByte(7)
      ..write(obj.existenciaTotal)
      ..writeByte(8)
      ..write(obj.ivaId)
      ..writeByte(9)
      ..write(obj.valor)
      ..writeByte(10)
      ..write(obj.codColor)
      ..writeByte(11)
      ..write(obj.color)
      ..writeByte(12)
      ..write(obj.talle)
      ..writeByte(13)
      ..write(obj.disponible)
      ..writeByte(14)
      ..write(obj.colorHexCode)
      ..writeByte(15)
      ..write(obj.r)
      ..writeByte(16)
      ..write(obj.g)
      ..writeByte(17)
      ..write(obj.b)
      ..writeByte(18)
      ..write(obj.imagenes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductoVarianteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
