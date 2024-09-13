import "package:go_router/go_router.dart";
import "package:showroom_maqueta/pages/dashboard.dart";
import "package:showroom_maqueta/pages/fulscreenProduct.dart";
import 'package:showroom_maqueta/pages/scanner_search.dart';
import "package:showroom_maqueta/pages/login_new.dart";
import "package:showroom_maqueta/pages/product_page.dart";
import "package:showroom_maqueta/pages/screensaver.dart";
import "package:showroom_maqueta/pages/seleccion_origen.dart";
import "package:showroom_maqueta/pages/version_check.dart";

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/video_screen',
      name: VideoScreen.name,
      builder: (context, state) => VideoScreen(),
    ),
    GoRoute(
      path: '/fullscreen_product_page',
      name: FulscreenProduct.name,
      builder: (context, state) => const FulscreenProduct(),
    ),
    GoRoute(
      path: '/select_origin',
      name: SeleccionOrigen.name,
      builder: (context, state) => const SeleccionOrigen(),
    ),
    GoRoute(
      path: '/product_page',
      name: ProductPage.name,
      builder: (context, state) => ProductPage(context: context,)
    ),
    GoRoute(
      path: '/product_add',
      name: AgregarPedido.name,
      builder: (context, state) => const AgregarPedido(),
    ),
    GoRoute(
      path: '/login',
      name: LoginNew.name,
      builder: (context, state) => const LoginNew(),
    ),
    GoRoute(
      path: '/',
      name: VersionCheckPage.name,
      builder: (context, state) => const VersionCheckPage(),
    ),
    GoRoute(
      path: '/dashboard',
      name: DashboardPage.name,
      builder: (context, state) => const DashboardPage(),
    ),

  ]
);