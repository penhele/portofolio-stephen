import 'package:flutter/material.dart';

import '../model/page_configuration.dart';
import '../ui/home.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool _isUnknown = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  PageConfiguration? get currentConfiguration {
    return _isUnknown ? UnknownPageConfiguration() : HomePageConfiguration();
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration is UnknownPageConfiguration) {
      _isUnknown = true;
    } else {
      _isUnknown = false;
    }
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_isUnknown)
          const MaterialPage(
            child: Scaffold(body: Center(child: Text("404 - Page Not Found"))),
          )
        else
          const MaterialPage(child: HomeScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }
}
