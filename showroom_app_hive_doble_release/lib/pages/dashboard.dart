import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatelessWidget {
  static const String name = 'dashboard';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    int totalUfo = 8018;
    int totalSucUfo = 8738;
    int totalBm = 660;
    int totalTotal = totalBm + totalSucUfo + totalUfo;

    int totalPedidos = 82;
    int montoPedidos = 19947537;

    final money = new NumberFormat("#,##0", "en_US");

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          size: 40,
          color: Colors.black
        ),
        backgroundColor: colors.primary,
        title: const Text('Dashboard', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text('Facturación Del Día: ', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center, )),
                        const Divider(height: 10,thickness: 3,),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('UFO: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$${money.format(totalUfo)}', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('BlackMamba: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$${money.format(totalBm)}', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('Sucursal UFO: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$${money.format(totalSucUfo)}', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                            
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('Total: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$${money.format(totalTotal)}', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Text('Pedidos de la temporada: ', style: TextStyle(color: Colors.black, fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        const Divider(height: 5, thickness: 3,),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('Cantidad total: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('$totalPedidos', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10,),
                            const Text('Monto: ', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('\$${money.format(montoPedidos)}', style: const TextStyle(color: Colors.cyan, fontSize: 28,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}