// ignore_for_file: prefer_null_aware_operators

import 'package:hive/hive.dart';
part 'productoVariante.g.dart';

@HiveType(typeId: 1)
class ProductoVariante extends HiveObject{

@HiveField(0)
late int itemId;
@HiveField(1)
late String codItem;
@HiveField(2)
late int monedaId;
@HiveField(3)
late String signo;
@HiveField(4)
late double precioVentaActual;
@HiveField(5)
late double precioIvaIncluido;
@HiveField(6)
late int existenciaActual;
@HiveField(7)
late int existenciaTotal;
@HiveField(8)
late int ivaId;
@HiveField(9)
late int valor;
@HiveField(10)
late String codColor;
@HiveField(11)
late String color;
@HiveField(12)
late String talle;
@HiveField(13)
late int disponible;
@HiveField(14)
late int colorHexCode;
@HiveField(15)
late int r;
@HiveField(16)
late int g;
@HiveField(17)
late int b;
@HiveField(18)
late List<dynamic> imagenes;

ProductoVariante({
  required this.itemId,
  required this.codItem,
  required this.monedaId,
  required this.signo,
  required this.precioVentaActual,
  required this.precioIvaIncluido,
  required this.existenciaActual,
  required this.existenciaTotal,
  required this.ivaId,
  required this.valor,
  required this.codColor,
  required this.color,
  required this.talle,
  required this.disponible,
  required this.colorHexCode,
  required this.r,
  required this.g,
  required this.b,
  required this.imagenes
});

static ProductoVariante fromJson(Map<String, dynamic> json) {
    return ProductoVariante(
      signo: json['Signo'] as String? ?? '',
      color: json['Color'] as String? ?? '',
      itemId: json['ItemId'] as int? ?? 0,
      codItem: json['CodItem'] as String? ?? '',
      monedaId: json['MonedaId'] as int? ?? 0,
      precioVentaActual: json['PrecioVentaActual'] == null ? null : json['PrecioVentaActual'].toDouble(),
      existenciaActual: json['ExistenciaActual'] as int? ?? 0,
      precioIvaIncluido: json['PrecioIvaIncluido'] == null ? null : json['PrecioIvaIncluido'].toDouble(),
      existenciaTotal: json['ExistenciaTotal'] as int? ?? 0,
      ivaId: json['IvaId'] as int? ?? 0,
      valor: json['Valor'] as int? ?? 0,
      colorHexCode: int.parse(json['ColorHexCode'] ?? '0'),
      talle: json['Talle'] as String? ?? '',
      r: json['R'] as int? ?? 0,
      g: json['G'] as int? ?? 0,
      b: json['B'] as int? ?? 0,
      disponible: json['Disponible'] as int? ?? 0, 
      codColor: json['CodColor'] as String? ?? '',
      imagenes: json['FotosUrl'] as List<dynamic>,

    );
  }


ProductoVariante.empty(){

itemId = 0;
codItem = '';
monedaId = 0;
signo = '';
precioVentaActual = 0.0;
precioIvaIncluido = 0.0;
existenciaActual = 0;
existenciaTotal = 0;
ivaId = 0;
valor = 0;
codColor = '';
color = '';
talle = '';
disponible = 0;
colorHexCode = 0;
r = 0;
g = 0;
b = 0;
imagenes = [];
}

}

