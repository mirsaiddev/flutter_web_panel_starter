import 'package:flutter/material.dart';
import 'package:flutter_web_panel_starter/screens/Home/home_screen.dart';
import 'package:flutter_web_panel_starter/screens/Settings/settings_screen.dart';

Map<String, Widget> pages = {
  'home': const HomeScreen(),
  'settings': const SettingsScreen(),
};

class PageBuilderProvider extends ChangeNotifier {
  Widget get getCurrentPage => pages[currentPage]!;

  String currentPage = 'home';

  List<String> hoveredPages = [];

  void addHoveredPage(String page) {
    hoveredPages.add(page);
    notifyListeners();
  }

  void removeHoveredPage(String page) {
    hoveredPages.remove(page);
    notifyListeners();
  }

  void setCurrentPage(String page) {
    currentPage = page;
    notifyListeners();
  }
}
