import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter_deep_link_handler/routes/app_routes.dart';

class DeepLinkHandler extends StatefulWidget {
  final Widget child;

  const DeepLinkHandler({super.key, required this.child});

  @override
  State<DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  late final AppLinks appLinks;
  StreamSubscription<Uri>? sub;
  Uri? lastHandledUri;

  @override
  void initState() {
    super.initState();
    appLinks = AppLinks();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    final Uri? initialUri = await appLinks.getInitialLink();
    if (initialUri != null) {
      await handleUri(initialUri);
    }

    sub = appLinks.uriLinkStream.listen(
      (Uri uri) async {
        await handleUri(uri);
      },
      onError: (err) {
        debugPrint('Deep link error: $err');
      },
    );
  }

  Future<void> handleUri(Uri uri) async {
    if (lastHandledUri == uri) {
      debugPrint('Duplicate deep link ignored: $uri');
      return;
    }
    lastHandledUri = uri;

    debugPrint('Handling deep link: $uri');

    await DeepLinkRoutes.handle(uri);
  }

  @override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
