import 'package:account_book/di/my_service.dart';
import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/login/login_screen.dart';
import 'package:account_book/presentation/main.dart';
import 'package:account_book/presentation/setting/add_account.dart';
import 'package:account_book/presentation/setting/add_expense.dart';
import 'package:account_book/presentation/setting/add_income.dart';
import 'package:account_book/presentation/setting/setting_screen.dart';
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
        GetPage(name: "/main", page: () => const MainPage()),
        GetPage(name: "/setting", page: () => const SettingScreen()),
        GetPage(name: "/addAccount", page: () => const AddAccount()),
        GetPage(name: "/addIncome", page: () => const AddIncome()),
        GetPage(name: "/addExpense", page: () => const AddExpense()),
      ],
    );
  }
}
