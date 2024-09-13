
                    // if (botonColorApretado)...[
                    //   mostrarTalles2(ProductColor.empty())
                    // ],

                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Container(
                    //     decoration: const BoxDecoration(
                    //         color: Colors
                    //             .cyan), //toDo sacar box decoration(para ver el tama;o)
                    //     margin: const EdgeInsets.all(15),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(15.0),
                    //           child: tabla(),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),


  // DataTable tabla() {
  //   const opacity = 255;
  //   return DataTable(
  //     border: TableBorder.all(),
  //     dataRowMaxHeight: 126,
  //     columns: [
  //       const DataColumn(
  //         label: SizedBox(
  //           width: 38,
  //           child: Icon(Icons.checkroom_rounded),
  //         ),
  //       ),
  //       const DataColumn(
  //         label: Padding(
  //           padding: EdgeInsets.all(8.0),
  //           child: Text('Talles'),
  //         ),
  //       ),
  //       for (var talle in talles)
  //         DataColumn(
  //             label: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: CircleAvatar(
  //             backgroundColor: Colors.grey,
  //             child: Center(
  //                 child: Text(
  //               talle,
  //               style: const TextStyle(color: Colors.black),
  //             )),
  //           ),
  //         )),
  //     ],
  //     rows: [
  //       for (var colorcito in colors)
  //         filas(Color.fromARGB(opacity, colorcito.r, colorcito.g, colorcito.b),
  //             colorcito.colorHexCode, colorcito.codColor)
  //     ],
  //   );
  // }

  // filas(miColor, int colorHex, String codColorcito) {
  //   return DataRow(cells: [
  //     DataCell(CircleAvatar(
  //       backgroundColor: miColor,
  //       child: Text(
  //         codColorcito,
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     )),
  //     const DataCell(Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Disp:',
  //           style: TextStyle(fontSize: 16),
  //         ),
  //         SizedBox(
  //           height: 18,
  //         ),
          // Text(
          //   'Cant:',
          //   style: TextStyle(fontSize: 16),
          // ),
          // SizedBox(
          //   height: 18,
          // ),
  //         Text(
  //           'Precio:',
  //           style: TextStyle(fontSize: 16),
  //         ),
  //       ],
  //     )),
  //     for (String talle in talles)
  //       for (int i = 0; i < _products!.length; i++)
  //         if (_products![i].colorHexCode == colorHex)
  //           if (_products![i].talle == talle) ...[
  //             DataCell(Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 Text(_products![i].disponible.toString()),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 //cantidad2(_products![i].talle, _products![i].codColor),
  //                 precio1(_products![i].talle, _products![i].codColor,
  //                     _products![i].precioIvaIncluido),
  //               ],
  //             )),
  //           ]
  //   ]);
  // }

  // TextFormField precio1(String talle, String color, valor) => TextFormField(
  //       initialValue: valor.toString(),
  //       textAlign: TextAlign.center,
  //       keyboardType: const TextInputType.numberWithOptions(decimal: true),
  //       inputFormatters: [
  //         FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
  //       ],
  //       onChanged: (value) {
  //         if (value.isEmpty) {
  //          // actualizarPrecio(talle, color, 0.0);
  //         } else {
  //         //  actualizarPrecio(talle, color, double.parse(value));
  //         }
  //       },
  //     );

  // cantidad() {
  //   return SizedBox(
  //     height: 35,
  //     width: 60,
  //     child: TextField(
  //       inputFormatters: [cantMask],
  //       enabled: false,
  //       textAlign: TextAlign.right,
  //       decoration: InputDecoration(
  //           hintText: "",
  //           counterText: "",
  //           fillColor: Colors.grey[300],
  //           filled: true,
  //           border:
  //               OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
  //     ),
  //   );
  // }

  // cantidad2(String talle, String color) {
  //   return SizedBox(
  //     height: 35,
  //     width: 60,
  //     child: TextField(
  //       inputFormatters: [cantMask],
  //       textAlign: TextAlign.right,
  //       decoration: InputDecoration(
  //         hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
  //         hintText: "0",
  //         counterText: "",
  //         fillColor: Colors.grey[300],
  //         filled: true,
  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
  //       ),
  //       onChanged: (value) {
  //         if (value.isEmpty) {
  //           //actualizarCantidad(talle, color, 0);
  //         } else {
  //           //actualizarCantidad(talle, color, int.parse(value));
  //         }
  //       },
  //     ),
  //   );
  // }

  // bottomBody() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(5),
  //           color: Colors.blueGrey[200]),
  //       child: Column(
  //         children: [
  //           // SizedBox(
  //           //   height: 180,
  //           // ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 const Text(
  //                   'Cantidad de Items:',
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.black),
  //                 ),
  //                 const SizedBox(
  //                   width: 20,
  //                 ),
  //                 Text(
  //                   cantidadTotal.toString(),
  //                   style: const TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.black),
  //                 )
  //               ],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 20,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 const Text(
  //                   'Precio Total:',
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.black),
  //                 ),
  //                 const SizedBox(
  //                   width: 20,
  //                 ),
  //                 Text(
  //                   montoTotal.toString(),
  //                   style: const TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w700,
  //                       color: Colors.black),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // actualizarPrecio(String talle, String codColor, double precio) {
  //   Product p = _products!.firstWhere(
  //       (element) => element.talle == talle && element.codColor == codColor);
  //   p.precioIvaIncluido = precio;
  //   calcular();
  // }

  // actualizarCantidad(String talle, String codColor, int cantidad) {
  //   Product p = _products!.firstWhere(
  //       (element) => element.talle == talle && element.codColor == codColor);
  //   p.cantidad = cantidad;
  //   calcular();
  // }

  // calcular() {
  //   setState(() {
  //     cantidadTotal = 0;
  //     montoTotal = 0.0;
  //     for (var i = 0; i < _products!.length; i++) {
  //       montoTotal +=
  //           (_products![i].cantidad * _products![i].precioIvaIncluido)
  //               .roundToDouble();
  //       cantidadTotal += (_products![i].cantidad).toInt();
  //     }
  //   });
  // }

  // Widget mostrarTalles(ProductColor color) {
  //   return Column(
  //     children: [
  //       Container(color: Colors.red, child: const Text('Hola')),
  //       for (String talle in talles)
  //         for (int i = 0; i < _products!.length; i++)
  //           if (_products![i].color == color.nombreColor) ...[
  //             Row(
  //               children: [
  //                 Container(color: Colors.green, child: const Text('Hola, for')),
  //                 Text(_products![i].disponible.toString()),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 precio1(_products![i].talle, _products![i].codColor,
  //                     _products![i].precioIvaIncluido)
  //               ],
  //             )
  //           ]
  //     ],
  //   );
  // }

  // Widget mostrarTalles2(ProductColor color) {
  //   List<Widget> widgetsToShow = [];

  //   for (String talle in talles) {
  //     // Para cada talle, busca los productos del color seleccionado
  //     List<Product> productosFiltrados = _products!
  //         .where((product) =>
  //             product.nombreColor == color.nombreColor &&
  //             product.talle == talle)
  //         .toList();

  //     // Si hay productos para este talle y color, muestra la información
  //     if (productosFiltrados.isNotEmpty) {
  //       print('test for talles');

  //       widgetsToShow.add(

  //         Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Text('Talle: $talle'), // Muestra el talle
  //             for (Product product in productosFiltrados)
  //               Row(
  //                 children: [
  //                   Container(color: Colors.green, child: Text('Hola, for')),
  //                   Text(product.disponible.toString()),
  //                   const SizedBox(height: 10,),
  //                   precio1(product.talle, product.codColor, product.precioIvaIncluido),
  //                 ],
  //               ),
  //             const Divider(), // Separador entre talles
  //           ],
  //         ),
  //       );
  //       widgetsToShow.add(Container(color: Colors.green, child: Text('Hola, for')));
  //     }
  //   }
  //   return Column(
  //     children: [
  //       Container(color: Colors.red, child: Text('Hola')),
  //       Container(color: Colors.purple, child: Text('Hola')),

  //       // Construye una lista de widgets
  //       ...talles.map((talle) {
  //         List<Widget> talleWidgets = widgetsToShow
  //             .where((widget) => widget is Column && widget.children.isNotEmpty)
  //             .map((widget) {
  //               return (widget as Column).children.firstWhere(
  //                 (child) => child is Text && (child as Text).data == 'Talle: $talle',
  //                 orElse: () => Container(), // Si no encuentra, devuelve un contenedor vacío
  //               );
  //             })
  //             .toList();
  //         return Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text('Talle: $talle'),
  //             ...talleWidgets,
  //             const Divider(),
  //           ],
  //         );
  //       }),
  //     ],
  //   );

  // }
