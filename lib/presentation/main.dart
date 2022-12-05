import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';

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
