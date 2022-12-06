import 'package:account_book/presentation/canlendar/view/calendar_main.dart';
import 'package:account_book/presentation/graph/view/graph_screen.dart';
import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/setting/setting_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainRouteService extends GetxService {
  static MainRouteService get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/history', '/calendar', '/statistic', '/settings'];
  final pageObjects = <Widget>[
    const HistoryScreen(),
    const CalendarMain(),
    const GraphScreen(),
    const SettingScreen()
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/history') {
      return GetPageRoute(
        transitionDuration: const Duration(milliseconds: 0),
        settings: settings,
        page: () => pageObjects[0],
      );
    }

    if (settings.name == '/calendar') {
      return GetPageRoute(
        transitionDuration: const Duration(milliseconds: 0),
        settings: settings,
        page: () => pageObjects[1],
      );
    }

    if (settings.name == '/statistic') {
      return GetPageRoute(
        transitionDuration: const Duration(milliseconds: 0),
        settings: settings,
        page: () => pageObjects[2],
      );
    }

    if (settings.name == '/settings') {
      return GetPageRoute(
        transitionDuration: const Duration(milliseconds: 0),
        settings: settings,
        page: () => pageObjects[3],
      );
    }
    return null;
  }
}
