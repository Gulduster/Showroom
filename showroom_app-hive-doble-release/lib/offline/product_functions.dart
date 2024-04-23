
import 'package:showroom_maqueta/models/product.dart';
import 'package:showroom_maqueta/offline/boxes.dart';


Future<void> addProductToBox(Product product) async {
  await boxProduct.put('key_${product.raiz}', product);
}
