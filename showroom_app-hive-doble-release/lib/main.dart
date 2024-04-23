import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:showroom_maqueta/config/router/app_router.dart';
import 'package:showroom_maqueta/config/theme/app_theme.dart';
import 'package:showroom_maqueta/models/product.dart';
import 'package:showroom_maqueta/models/productoVariante.dart';
import 'package:showroom_maqueta/offline/boxes.dart';
import 'package:showroom_maqueta/providers/item_provider.dart';
import 'package:showroom_maqueta/providers/theme_provider.dart';
import 'package:provider/provider.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ProductoVarianteAdapter());


  
  
  boxProduct = await Hive.openBox<Product>('producstBox');
  runApp(MultiProvider(
    providers: [
       ChangeNotifierProvider(create: (_)=> ItemProvider(),),
       ChangeNotifierProvider(create: (_) => ThemeProvider(),),
    ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appTheme = AppTheme(selectedColor: themeProvider.selectedColor);
    return MaterialApp.router(
      routerConfig: appRouter,

      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('es', 'UY'), // Spanish
      ],
    );
  }
}