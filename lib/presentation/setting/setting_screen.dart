import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.indigo,
        fontFamily: 'Cabin',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _midController = TextEditingController();
  final _finalController = TextEditingController();


  @override
  void dispose() {
    _midController.dispose();
    _finalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              '설정',
              style: TextStyle(color:Color(0xff524D90))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(
              children:[
                TextField(
                  decoration: const InputDecoration(
                    labelText: '결제수단',
                  ),
                  controller: _midController,
                  enabled: false,
                  style: TextStyle(color: Colors.redAccent),
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '지출 카테고리',
                    iconColor: Color(0xffA79FCB),
                  ),
                  controller: _midController,
                  enabled: false,
                  style: TextStyle(color:Color(0xff524D90)),
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '수입 카테고리',
                  ),
                  controller: _midController,
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff524D90),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list_outlined,color: Colors.white38), label: '내역'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month,color: Colors.white38), label: '달력'),
            BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined,color: Colors.white38), label: '통계'),
            BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.white38), label: '설정')
          ],
        ),
      ),
    );
  }
}