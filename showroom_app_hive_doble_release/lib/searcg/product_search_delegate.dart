import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showroom_maqueta/providers/item_provider.dart';


import '../models/product.dart';
import '../services/product_services.dart';

class ProductSearchDelegate extends SearchDelegate {
  

  

  @override
  final String searchFieldLabel;
  final List<Product> historial;
  final String previousQuery;
  final List<dynamic> productosBuscados;
  bool estoyBuscando;
  ProductSearchDelegate(this.searchFieldLabel, this.historial,this.previousQuery, this.productosBuscados, this.estoyBuscando);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = previousQuery, icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    estoyBuscando = false;
    return IconButton(
      onPressed: () => Navigator.pop(context, query),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return const Text('No hay valor en el query');
    }
    
    final productServices = ProductServices();
    return FutureBuilder(
        future: productServices.getProductsOfflineFinal(query),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const ListTile(
              title: Text('no hay ningun producto con ese termino'),
            );
          }

          if (snapshot.hasData) {
            //todo problem here
            Provider.of<ItemProvider>(context,listen: false).setQuery(query);
            return _showProducts(snapshot.data);
          } else {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 4),
            );
          }
        });
  }



  @override
  Widget buildSuggestions(BuildContext context) {
    return _showProducts(productosBuscados);
  }

  Widget _showProducts(List<dynamic> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final producto = products[i];
          return ListTile(
            title: Text(producto.descripcion.toString()),
            subtitle: Text(producto.raiz.toString()),
            trailing: Text(producto.precioIvaIncluido.toString()),
            onTap: () {
              close(context, producto);
            },
          );
        });
  }
}
