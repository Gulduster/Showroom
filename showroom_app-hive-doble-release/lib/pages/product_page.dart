// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_new
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:showroom_maqueta/config/router/app_router.dart';
import 'package:showroom_maqueta/models/color.dart';
import 'package:showroom_maqueta/models/productoVariante.dart';
import 'package:showroom_maqueta/offline/boxes.dart';
import 'package:showroom_maqueta/offline/product_functions.dart';
import 'package:showroom_maqueta/providers/item_provider.dart';
import 'package:showroom_maqueta/services/product_services.dart';


import '../models/product.dart';

class ProductPage extends StatefulWidget {
  final BuildContext context;
  static const String name = 'product_page';
  const ProductPage({super.key, required this.context});
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<ProductoVariante>? _products = [];
  late String raiz = '';
  late String almacen = '';
  late String token1 = '';
  late String codTipoLista = '';
  var talles = <String>{};
  late List<ProductColor> colors;
  var priceMask =
      MaskTextInputFormatter(mask: '#######', filter: {"#": RegExp(r'[0-9.]')});
  var cantMask =
      new MaskTextInputFormatter(mask: '####', filter: {"#": RegExp(r'[0-9]')});
  late num cantidadTotal = 0;
  late double montoTotal = 0.0;
  Map<String, int> cantidadPorTalle = {};
  Map<String, String> cantidadAnteriorPorTalle = {};
  late List<List<Map<String, String>>> valoresCeldas;
  bool botonColorApretado = false;
  List<ProductoVariante> productosFiltrados = [];
  late String? imagenSeleccionadaRelacionados = '';
  late String? imagenSeleccionadaProducto = ''; 
  late List<String> imagenesRelacionadas = ['images/AH-4444.jpeg','images/AD-1234.jpeg','images/AH-2311.jpeg',];
  // late List<String> imagenesProducto = ['images/AH-5838.jpeg','images/AD-1234.jpeg','images/AH-4444.jpeg',];
  bool buscando = true;
  Product productoSeleccionado = Product.empty();
  Product productoNuevo = Product.empty();
  List<dynamic> productoPlaceholderList = [];
  Product productoPlaceholder = Product.empty();
  int imageActual = 0;
  bool colorSeleccionado = false;
  bool hayConexion = false;


  @override
  void initState(){
    super.initState();
    raiz = context.read<ItemProvider>().item;
    almacen = context.read<ItemProvider>().almacen;
    token1 = context.read<ItemProvider>().token;
    
    codTipoLista = '2';

    
    productoSeleccionado = context.read<ItemProvider>().product;
    _getData();
  }

    Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
    }

  void _getData() async {

    hayConexion = await _checkConnectivity();

    if(hayConexion){
      //todo llamar al metodo de la Api con la raiz que tengo definida arriba y actualizar la box
      productoNuevo = await ProductServices().getSingleProductByRaiz(raiz, almacen, token1);
      productoPlaceholderList = await ProductServices().getProductsOfflineFinal(productoSeleccionado.raiz);
      productoPlaceholder = productoPlaceholderList[0];
      
      boxProduct.delete(productoPlaceholder.key);
      
      addProductToBox(productoNuevo);
      productoSeleccionado = boxProduct.get('key_$raiz');
    }

    _products = productoSeleccionado.variantes;
    
    
    List<dynamic> listaTalles =
        _products!.where((productoVariante) => talles.add(productoVariante.talle)).toList(); 
    var models = <ProductColor>{};
    for (var i = 0; i < _products!.length; i++) {
      models.add(
        ProductColor(
          isSelected: false,
            nombreColor: _products![i].color,
            colorHexCode: _products![i].colorHexCode,
            r: _products![i].r,
            g: _products![i].g,
            b: _products![i].b,
            codColor: _products![i].codColor),
      );
    }
    colors = models.toSet().toList();
    // List<List<Map<String, int>>> valoresCeldas = List.generate(
    //     colors.length,
    //     (index) =>
    //         List.generate(talles.length, (innerIndex) => {'indice': -1}));
    // for (var indice = 0; indice < _products!.length; indice++) {}
    buscando = false;    

    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 14,
        backgroundColor: colores.primary,
        iconTheme: const IconThemeData(
          size: 40,
        ),
        title: Text(
          productoSeleccionado.raiz
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 30,

        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //topBody(context),
              middleBody(),
              const SizedBox(height: 50),
              
              //bottomBody(),
              
            ],
          ),
        ),
      ),
      //bottomNavigationBar: footer(context),

    );
  }

  topBody(BuildContext context) {
    final raiz = context.watch<ItemProvider>().product.raiz;
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey[200],
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            productoSeleccionado.raiz,
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Color getTextColor(Color backgroundColor) {
    var luminance = 0.2126 * backgroundColor.red +
        0.7152 * backgroundColor.green +
        0.0722 * backgroundColor.blue;
    // Decide si el texto debería ser oscuro o claro en función de la luminosidad
    return luminance > 128 ? Colors.black : Colors.white;
  }

  bool anyColorIsSelected(List<ProductColor> colors) {
    for (var color in colors){
      if (color.isSelected){
        return true;
      }
    }
    return false;
  }

  middleBody() {
    final colores = Theme.of(context).colorScheme;
    
    List<dynamic> listaTalles =
        _products!.where((talle) => talles.add(talle.talle)).toList();
    late String? talleSeleccionado; 
    return buscando
        ?  const Center(
            child: CircularProgressIndicator(),
          )
        : _products!.isEmpty || _products == null ?
          const Center(child: Text('El Producto no existe', style: TextStyle(fontSize: 24))) 
          :  Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  ), //Colors.blueGrey[200]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          productoSeleccionado.descripcion,
                          style: const TextStyle(fontSize: 35),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: CarouselSlider(

                        options: CarouselOptions(
                          onPageChanged: (i,reason){
                            imageActual = i;
                            imagenSeleccionadaProducto = productoSeleccionado.imagenes[i];
                          },

                          height: MediaQuery.of(context).size.height / 2.5,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.6,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items:productoSeleccionado.imagenes.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () {
                                  appRouter.push('/fullscreen_product_page');
                                  context.read<ItemProvider>().setImageIndex(imageActual);

                                },
                                child: CachedNetworkImage(
                                  
                                  height: MediaQuery.of(context).size.height/3,
                                  imageUrl: item,
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),

                    ),
                    //const SizedBox(height: 10,),



                    showColorButtons(),

                    const SizedBox(height: 15,),

                    if (productosFiltrados.isNotEmpty) ...[
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                      
                        children: [
                          for (var producto in productosFiltrados) ...[
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text('Variante Seleccionada: ${producto.codItem}')),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: colores.primary,
                                    
                                  ),
                                );
                                
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(7)
                                ),
                                alignment: Alignment.center,
                                height: 80,
                                width: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  
                                    Text(
                                      producto.talle,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Divider(height: 2, thickness: 2,),
                                    const SizedBox(height: 5,),
                                    Text(
                                      producto.disponible.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      
                      ),
                      const SizedBox(height: 20,),
                    ],
                    Center(
                      child: Text(
                        productoSeleccionado.memo,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),

                    const SizedBox(height: 50,),

                    //todo relacionados aca
                    // const FittedBox(
                    //   fit: BoxFit.contain,
                    //   child: Text(
                    //     'Productos Relacionados',
                    //     style: TextStyle(fontSize: 38),
                    //   ),
                    // ),

                    
                    // Container(
                    //   color: colores.primary,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(7),
                    //     child: CarouselSlider(
                    //       options: CarouselOptions(
                    //       onPageChanged: (i, reason) {
                    //         //print(i);
                    //         print(imagenesRelacionadas[i]);
                    //         imagenSeleccionadaRelacionados = imagenesRelacionadas[i];
                    //       },
                            
                    //         height: MediaQuery.of(context).size.height/3.5,
                    //         aspectRatio: 16 / 9,
                    //         viewportFraction: 0.4,
                    //         initialPage: 0,
                    //         enableInfiniteScroll: true,
                    //         reverse: false,
                    //         autoPlay: true,
                    //         autoPlayInterval: const Duration(seconds: 5),
                    //         autoPlayAnimationDuration:
                    //             const Duration(milliseconds: 1000),
                    //         autoPlayCurve: Curves.fastOutSlowIn,
                    //         enlargeCenterPage: true,
                    //         scrollDirection: Axis.horizontal,
                    //       ),
                    //       items: imagenesRelacionadas.map((item) {
                    //         return Builder(
                    //           builder: (BuildContext context) {
                    //             return InkWell(
                    //               onTap: (){
                    //                 print(imagenSeleccionadaRelacionados);
                    //               },
                    //               child: Image(
                    //                 height: MediaQuery.of(context).size.height/4,
                    //                 image: AssetImage(item),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),  
                  ]
                ),
            ),
          );         
  }

 Wrap showColorButtons() {
  return Wrap(
    alignment: WrapAlignment.center,
    spacing: 10,
    children: [
      for (var color in colors)
        ElevatedButton.icon(
          icon: color.isSelected ? Icon(Icons.check, color: getTextColor(
                  Color.fromARGB(255, color.r, color.g, color.b)),) : SizedBox(),
          onPressed: () {
            setState(() {
              for (var c in colors) {
                c.isSelected = false; // Deselect all colors
              }
              mostrarTalles2(color);
              color.isSelected = true; // Select the current color
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, color.r, color.g, color.b)),
          ),
          label: Text(
            '${color.nombreColor} ${color.codColor}',
            style: TextStyle(
              fontSize: 25,
              color: getTextColor(
                  Color.fromARGB(255, color.r, color.g, color.b)),
            ),
          ),
        ),
    ],
  );
}


  Container footer(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                appRouter.pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                height: 60,
                width: 170,
                decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Atras',
                    style: TextStyle(
                        fontSize:24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mostrarTalles2(ProductColor color) {
    for (String talle in talles) {
      productosFiltrados = _products!
          .where((product) => product.color == color.nombreColor)
          .toList();
    }
  }
}
