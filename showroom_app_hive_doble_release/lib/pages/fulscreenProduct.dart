import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:showroom_maqueta/config/router/app_router.dart';

import 'package:showroom_maqueta/models/product.dart';
import 'package:showroom_maqueta/providers/item_provider.dart';

class FulscreenProduct extends StatefulWidget {
  const FulscreenProduct({super.key});
  static const String name = 'fullscreen_product_page';

  @override
  State<FulscreenProduct> createState() => _FulscreenProductState();
}

class _FulscreenProductState extends State<FulscreenProduct> {

  late Product productoSeleccionado = Product.empty();
  //late List<String> imagenesProducto = ['images/AH-5838.jpeg','images/AD-1234.jpeg','images/AH-4444.jpeg',];
  late int indexActual = 0;


  @override
  void initState() {
    super.initState();
    productoSeleccionado = context.read<ItemProvider>().product;
    indexActual = context.read<ItemProvider>().imageIndex;
    
    
  }

  
  


  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: InkWell(
        onTap: () => appRouter.pop(),
        child: Container(
          color: colors.primary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PhotoViewGallery.builder(
            pageController: PageController(initialPage: indexActual),
            itemCount: productoSeleccionado.imagenes.length,
            builder: (context, index) {
              final imagenSeleccionada = productoSeleccionado.imagenes[index];
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(imagenSeleccionada),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained * 4,
        
              );
            },
            )
          //productoSeleccionado.imagenes[indexActual],
        ),
      )
    );
                }
                                 
}