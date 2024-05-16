import 'package:cart_riverpod/router/router_path.dart';
import 'package:cart_riverpod/views/pages/cart_list_page.dart';
import 'package:cart_riverpod/views/pages/cart_add_page.dart';
import 'package:cart_riverpod/views/pages/qr_scanner_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RouterPath.index,
  routes: [
    GoRoute(
      path: RouterPath.index,
      name: RouterPath.index,
      builder: (context, state) => const CartAddPage(),
    ),
    GoRoute(
      path: RouterPath.list,
      name: RouterPath.list,
      builder: (context, state) => const CartListPage(),
    ),
    GoRoute(
      path: RouterPath.qrscan,
      name: RouterPath.qrscan,
      builder: (context, state) => const QrScannerPage(),
    ),
  ],
);
