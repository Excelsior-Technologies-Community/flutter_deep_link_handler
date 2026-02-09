import 'package:flutter/material.dart';
import 'package:flutter_deep_link_handler/navigation/app_navigator.dart';

typedef DeepLinkHandlerFn = Future<void> Function(Uri uri);

class DeepLinkRoutes {
  static final Map<String, DeepLinkHandlerFn> routes = {
    '/profile': (uri) async {
      final id = uri.queryParameters['id'];
      await AppNavigator.pushNamed('/profile', args: {'id': id});
    },

    '/product': (uri) async {
      final productId = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
      await AppNavigator.pushNamed('/product', args: {'id': productId});
    },
  };

  static Future<void> handle(Uri uri) async {
    debugPrint('DeepLinkRoutes.handle -> $uri');

    final path = uri.pathSegments.isEmpty ? '/' : '/${uri.pathSegments.first}';

    final handler = routes[path];
    if (handler != null) {
      await handler(uri);
    } else {
      debugPrint('No route registered for: $path');
    }
  }
}
