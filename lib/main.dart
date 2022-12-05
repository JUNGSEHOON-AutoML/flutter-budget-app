import 'package:account_book/di/my_service.dart';
import 'package:account_book/presentation/canlendar/view/calendar_main.dart';
import 'package:account_book/presentation/graph/view/graph_view.dart';
import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

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
      initialRoute: "/graph",
      getPages: [
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/history", page: () => const HistoryScreen()),
        GetPage(name: "/calendar", page: () => const Calendar_Main()),
        GetPage(name: "/graph", page: () => const Graph_View()),
      ],
    );
  }
}
