import 'package:account_book/application/my_service.dart';
import 'package:account_book/presentation/login/login_screen.dart';
import 'package:account_book/presentation/main.dart';
import 'package:account_book/application/main_route_service.dart';
import 'package:account_book/presentation/setting/add_account.dart';
import 'package:account_book/presentation/setting/add_expense.dart';
import 'package:account_book/presentation/setting/add_history.dart';
import 'package:account_book/presentation/setting/add_income.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 웹 미리보기에서는 Firebase 웹 설정이 없으므로 초기화하지 않는다.
  if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Get.put(MyService());
  await MyService.init();
  Get.put(MainRouteService());

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
        primarySwatch: Colors.purple,
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/main", page: () => const MainPage()),
        GetPage(name: "/addAccount", page: () => const AddAccount()),
        GetPage(name: "/addIncome", page: () => const AddIncome()),
        GetPage(name: "/addExpense", page: () => const AddExpense()),
        GetPage(name: "/addHistory", page: () => const AddHistory())
      ],
    );
  }
}
