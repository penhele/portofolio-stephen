import 'package:flutter/material.dart';

import '../model/page_configuration.dart';
import '../ui/home.dart';
import '../ui/project/all_project.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  bool _isUnknown = false;
  bool _isAllProject = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  PageConfiguration? get currentConfiguration {
    if (_isUnknown) return UnknownPageConfiguration();
    if (_isAllProject) return AllProjectPageConfiguration();
    return HomePageConfiguration();
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration is UnknownPageConfiguration) {
      _isUnknown = true;
      _isAllProject = false;
    } else if (configuration is AllProjectPageConfiguration) {
      _isAllProject = true;
      _isUnknown = false;
    } else {
      _isUnknown = false;
      _isAllProject = false;
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
        else if (_isAllProject)
          const MaterialPage(child: AllProjectScreen())
        else
          const MaterialPage(child: HomeScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        // ✅ Saat halaman all-project dipop, balik ke Home
        if (_isAllProject) {
          _isAllProject = false;
          notifyListeners();
        }

        // Jika 404, bisa dikosongkan atau handle lain
        return true;
      },
    );
  }
}
