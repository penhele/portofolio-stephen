import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'provider/show_more_provider.dart';
import 'routes/route_information_parser.dart';
import 'routes/router_delegate.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShowMoreProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyRouterDelegate _routerDelegate = MyRouterDelegate();
  final MyRouteInformationParser _routeInformationParser =
      MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
