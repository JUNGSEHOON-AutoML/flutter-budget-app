import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/main_controller.dart';
import 'package:account_book/presentation/setting/setting_screen.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainController = MainService.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/history',
        onGenerateRoute: mainController.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
          ()=> BottomNavigationBar(
            backgroundColor: AppColor.purple1,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                /*icon: SvgPicture.asset("/assets/icons/ic_list_gray.svg",
                color: Colors.grey),*/
                icon: Image.asset("assets/icons/ic_list_grey.png"),
                activeIcon: Image.asset("assets/icons/ic_list_white.png",
                    color: Colors.white),
                label: '내역',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/icons/ic_calendar_grey.png"),
                activeIcon: Image.asset("assets/icons/ic_calendar_white.png",
                    color: Colors.white),
                label: '달력',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/icons/ic_statistic_grey.png"),
                activeIcon: Image.asset("assets/icons/ic_statistic_white.png",
                    color: Colors.white),
                label: '통계',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/icons/ic_setting_grey.png"),
                activeIcon: Image.asset("assets/icons/ic_setting_white.png",
                    color: Colors.white),
                label: '설정',
              ),
            ],
            currentIndex: mainController.currentIndex.value,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            onTap: mainController.changePage,
          )
      )
    );
  }
}

