/*
import 'package:account_book/di/my_service.dart';
import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(MyService());
  await MyService.init();

  runApp(const AccountBookApp());
}

class AccountBookApp extends StatelessWidget {
  const AccountBookApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/history", page: () => const HistoryScreen())
      ],
    );
  }
}
*/

import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIdx = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    HistoryScreen(),
    HistoryScreen(),
    HistoryScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIdx),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIdx,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}
