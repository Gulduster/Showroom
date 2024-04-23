// ignore_for_file: prefer_null_aware_operators

import 'package:hive/hive.dart';
import 'package:showroom_maqueta/models/productoVariante.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String codAlmacen;
  @HiveField(1)
  late String raiz;
  @HiveField(2)
  late String descripcion;
  @HiveField(3)
  late int monedaId;
  @HiveField(4)
  late String memo;
  @HiveField(5)
  late String signo;
  @HiveField(6)
  late double precioVentaActual;
  @HiveField(7)
  late double precioIvaIncluido; 
  @HiveField(8)
  late int ivaId;
  @HiveField(9)
  late int valor;
  @HiveField(10)
  late int disponibleRaiz;
  @HiveField(11)
  late int existenciaRaiz;
  @HiveField(12)
  late List<ProductoVariante> variantes;
  @HiveField(13)
  late List<dynamic> imagenes;

  Product({
    required this.codAlmacen,
    required this.raiz,
    required this.descripcion,
    required this.monedaId,
    required this.memo,
    required this.signo,
    required this.precioVentaActual,
    required this.precioIvaIncluido,
    required this.ivaId,
    required this.valor,
    required this.disponibleRaiz,
    required this.existenciaRaiz,
    required this.variantes,
    required this.imagenes  
    
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      codAlmacen: json['CodAlmacen'] as String? ?? '',
      raiz: json['Raiz'] as String? ?? '',
      descripcion: json['Descripcion'] as String? ?? '',
      monedaId: json['MonedaId'] as int? ?? 0,
      memo: json['Memo'] as String? ?? '',
      signo: json['Signo'] as String? ?? '',
      precioVentaActual: json['PrecioVentaActual'] == null ? null : json['PrecioVentaActual'].toDouble(),
      precioIvaIncluido: json['PrecioIvaIncluido'] == null ? null : json['PrecioIvaIncluido'].toDouble(),
      ivaId: json['IvaId'] as int? ?? 0,
      valor: json['Valor'] as int? ?? 0,
      disponibleRaiz: json['DisponibleRaiz'] as int? ?? 0,
      existenciaRaiz: json['ExistenciaRaiz'] as int? ?? 0,
      variantes: List<ProductoVariante>.from(json["variantes"].map((x)=> ProductoVariante.fromJson(x))).toList(),
      imagenes: json['FotosUrl'] as List<dynamic>,

      
      
    );
  }

  Product.empty() {
    codAlmacen = '';
    raiz = '';
    descripcion = '';
    monedaId = 0;
    memo = '';
    signo = '';
    precioVentaActual = 0.0;
    precioIvaIncluido = 0.0;
    ivaId = 0;
    valor = 0;
    disponibleRaiz = 0;
    existenciaRaiz = 0;
    variantes = [];
    imagenes = [];
    
    
  }

  @override
  String toString() {
    return 'Instance of Product: $descripcion';
  }
}

