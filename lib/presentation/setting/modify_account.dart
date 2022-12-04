import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModifyAccount extends StatelessWidget {
  const ModifyAccount({Key? key}) : super(key:key);

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
          title: const Text('결제수단 수정하기',style: TextStyle(color:Color(0xff524D90)),),
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context); //뒤로가기
              },
              color: Color(0xff524D90),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ListView(
              children:[
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  ),
                  controller: _midController,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: const Text('등록하기'),
                    style: ElevatedButton.styleFrom(
                      primary:Color(0xffF5B853),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      fixedSize: Size(100,50),
                    )
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