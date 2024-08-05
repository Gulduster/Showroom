// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:idle_detector_wrapper/idle_detector_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:showroom_maqueta/config/config.dart';
import 'package:showroom_maqueta/config/router/app_router.dart';
import 'package:showroom_maqueta/models/product.dart';
import 'package:showroom_maqueta/searcg/product_search_delegate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:showroom_maqueta/services/product_services.dart';

import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../providers/item_provider.dart';

class AgregarPedido extends StatefulWidget {

  static const String name = 'agregar_pedido';
  const AgregarPedido({super.key});

  @override
  State<AgregarPedido> createState() => _AgregarPedidoState();
}

class _AgregarPedidoState extends State<AgregarPedido> {
  List listItems = ['AH-5838','AH-2311','AH-4444','AD-1234',];
  late Product productoSeleccionado = Product.empty();
  List<Product> historial = [];
  String ticket = '';
  List<String> tickets = [];
  String? _barcode;
  String result = '';
  late bool visible;
  List<Product> product = [];
  int duracion = 30;
  bool arrancarContador = false;
  String token = '';
  List<Product> productosOffline = [];
  List<dynamic> productoScanner = [];
  List<dynamic> productoScannerVariante = [];
  String modo = Config.MODO;
  String _previousQuery = '';
  
  List<dynamic> productosBuscados = [];
  bool estoyBuscando = true;


  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
        '#FFFFFF', 'Cancelar', false, ScanMode.QR);
    context.read<ItemProvider>().setItem(code);
    final prodPP =
        product.firstWhere((element) => element.raiz == code, orElse: () {
      return Product.empty();
    });
    context.read<ItemProvider>().setProduct(prodPP);

    arrancarContador = false;
    appRouter.push('/product_page');
    
  }
  

  @override
Widget build(BuildContext context) {
   _previousQuery = context.read<ItemProvider>().query;
  if(estoyBuscando){
    arrancarContador = false;
  }else{
    arrancarContador = true;
  }
  
  print('pase Por build');
  final colors = Theme.of(context).colorScheme;

  
  

  if (modo == 'T'){
    
    return IdleDetector(
      idleTime: const Duration(seconds: 30),
      onIdle: (){
        print('llegoIdle');
        print(arrancarContador);
        if(arrancarContador) {
          appRouter.push('/video_screen');
        } 
      },
      child: ScaffoldScannerSearch(context, colors)
    );
  }else {
    return ScaffoldScannerSearch(context, colors);
  }



}

  Scaffold ScaffoldScannerSearch(BuildContext context, ColorScheme colors) {
    return Scaffold(
    appBar: AppBar(
    
    iconTheme: const IconThemeData(
      size: 40,
      color: Colors.white
    ),
    toolbarHeight: MediaQuery.of(context).size.height / 10,
    centerTitle: true,
    title:  InkWell(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          Text('Buscar Item',style: TextStyle(fontSize: 35, color: Colors.white), ),
          
          Icon(Icons.search,color: Colors.white,)
        ],
      ),
      onTap: () async {
        estoyBuscando = true;
        arrancarContador = false;
          final producto = await showSearch(
            context: context,
            delegate: ProductSearchDelegate( _previousQuery.isEmpty ? 'Buscar producto' : _previousQuery , historial, _previousQuery, productosBuscados, estoyBuscando),
          );
          if (producto != null) {
            
            List<dynamic> listaProductosBuscados =  await ProductServices().getProductsOfflineFinal(_previousQuery);
            setState(() {
              productoSeleccionado = producto;
              final int productoExiste = historial
                  .indexWhere((element) => element.raiz == producto.raiz);
              if (productoExiste == -1) {
                productosBuscados = listaProductosBuscados;
                historial.insert(0, producto);
              }
              context.read<ItemProvider>().setItem(producto.raiz);
              context.read<ItemProvider>().setProduct(producto);
              arrancarContador = false;
              appRouter.push('/product_page');
              
            });
          }
          
      },
      ),
    elevation: 0,
    backgroundColor: colors.primary,
  ),
  body: InkWell(
    onTap: () {
      arrancarContador = true;
    },
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
            height: MediaQuery.of(context).size.height /9,
          ),
          if (modo == 'T') ... [
            Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
    
                const Text('En caso de usar el lector:', 
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
    
                const SizedBox(
                  height: 20
                ),
    
    
                Container(
                  child: VisibilityDetector(
                    onVisibilityChanged: (VisibilityInfo info){
                      visible = info.visibleFraction > 0;
                    },
                    key: const Key('visible-detector-key'),
                    child: BarcodeKeyboardListener(
                      bufferDuration: const Duration(milliseconds: 200),
                      onBarcodeScanned: (barcode) async{
                        if(!visible) return;
                        print(barcode);
                        setState(() {
                          _barcode = barcode;
                        });
    
                        if (_barcode != null){                         
                          productoScanner = await ProductServices().getProductsOfflineFinal(barcode);
                          context.read<ItemProvider>().setProduct(productoScanner[0]);
                          context.read<ItemProvider>().setItem(productoScanner[0].raiz);
                          historial.insert(0, productoScanner[0]);
                          arrancarContador = false;
                          appRouter.push('/product_page');
                          
                        }
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Acerque producto al lector',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              decoration: TextDecoration.underline
                            )
                            
                          ),
                        ],
                      ),
                    ),
                  ),
                )
    
              ],
            ),
          ),
          ]else ... [
            // Container(
            //   height: MediaQuery.of(context).size.height /9,
            //   width: MediaQuery.of(context).size.width/1.1,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
              
            //       alignment: Alignment.center,
            //       backgroundColor: WidgetStatePropertyAll(colors.primary)
            //     ),
            //     onPressed: () async {
            //       var res = await Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SimpleBarcodeScannerPage(),
            //         ),
            //       );
            //       if (res == null) {
            //         print("El scanner se cerro o no se tiene permisos de cámara");
            //       }
            //       if (res is String) {
            //         result = res;
            //         if (result != '-1'){
            //           productoScanner = await ProductServices().getProductsOfflineFinal(result);
            //           context.read<ItemProvider>().setProduct(productoScanner[0]);
            //           context.read<ItemProvider>().setItem(productoScanner[0].raiz);
            //           historial.insert(0, productoScanner[0]);
            //           appRouter.push('/product_page');    
            //         }
                     
            //       }
            //       setState(() {
                    
            //       });
            //     },
            //     child: const Text(

            //       'Escanee Un Producto con su telefono',textAlign: TextAlign.center,
            //       style: TextStyle(fontSize: 22, color: Colors.white, ), 
                  
            //     ),
            //   ),
            // ),
            //     const SizedBox(
            //       height: 16,
            //     ),
    
            //     Text('Barcode Result: $result'),
          ],
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: historial.length,
              itemBuilder: (context, i) {
                final producto = historial[i];
                return ListTile(
                  title: Text(producto.descripcion.toString()),
                  subtitle: Text(producto.raiz.toString(), style: const TextStyle(fontSize: 14),),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width/5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(producto.precioVentaActual.toString(), style: const TextStyle(fontSize: 14),),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    context.read<ItemProvider>().setProduct(producto);
                    context.read<ItemProvider>().setItem(producto.raiz);
                    arrancarContador = false;
                    appRouter.push('/product_page');
                  },
                );
              },
              
            ),
            
          ),
          if(modo == 'T')...[
            Container(
            alignment: Alignment.bottomCenter,
            child: const Text('Toque la Pantalla al finalizar el uso', style: TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 30,)
          ]
          

          
        ],
    
        
      ),
    ),
  ),
);
}


}

