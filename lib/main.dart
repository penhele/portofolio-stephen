import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/theme_controller.dart';
import 'provider/show_more_provider.dart';
import 'routes/route_information_parser.dart';
import 'routes/router_delegate.dart';
import 'utils/constants/theme/theme.dart';

void main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShowMoreProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: MyRouterDelegate(),
          routeInformationParser: MyRouteInformationParser(),
          theme: SAppTheme.lightTheme,
          darkTheme: SAppTheme.darkTheme,
          themeMode: themeController.theme,
        );
      },
    );
  }
}
