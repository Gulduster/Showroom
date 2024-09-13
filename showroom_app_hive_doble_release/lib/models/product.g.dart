// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      codAlmacen: fields[0] as String,
      raiz: fields[1] as String,
      descripcion: fields[2] as String,
      monedaId: fields[3] as int,
      memo: fields[4] as String,
      signo: fields[5] as String,
      precioVentaActual: fields[6] as double,
      precioIvaIncluido: fields[7] as double,
      ivaId: fields[8] as int,
      valor: fields[9] as int,
      disponibleRaiz: fields[10] as int,
      existenciaRaiz: fields[11] as int,
      variantes: (fields[12] as List).cast<ProductoVariante>(),
      imagenes: (fields[13] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.codAlmacen)
      ..writeByte(1)
      ..write(obj.raiz)
      ..writeByte(2)
      ..write(obj.descripcion)
      ..writeByte(3)
      ..write(obj.monedaId)
      ..writeByte(4)
      ..write(obj.memo)
      ..writeByte(5)
      ..write(obj.signo)
      ..writeByte(6)
      ..write(obj.precioVentaActual)
      ..writeByte(7)
      ..write(obj.precioIvaIncluido)
      ..writeByte(8)
      ..write(obj.ivaId)
      ..writeByte(9)
      ..write(obj.valor)
      ..writeByte(10)
      ..write(obj.disponibleRaiz)
      ..writeByte(11)
      ..write(obj.existenciaRaiz)
      ..writeByte(12)
      ..write(obj.variantes)
      ..writeByte(13)
      ..write(obj.imagenes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
