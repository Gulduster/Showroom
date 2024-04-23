import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        color: colors.primary,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider(
                options:CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: indexActual,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: productoSeleccionado.imagenes.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: (){
                          appRouter.pop();
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
    );
  }
}