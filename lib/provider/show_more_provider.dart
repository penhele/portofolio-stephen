import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowMoreProvider with ChangeNotifier {
  static const String _key = 'show_all_web';

  bool _showAll = false;
  bool _initialized = false;

  bool get showAll => _showAll;
  bool get initialized => _initialized;

  ShowMoreProvider() {
    _loadFromPrefs();
  }

  void toggle() {
    _showAll = !_showAll;
    notifyListeners();
    _saveToPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _showAll = prefs.getBool(_key) ?? false;
    _initialized = true;
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_key, _showAll);
  }
}
