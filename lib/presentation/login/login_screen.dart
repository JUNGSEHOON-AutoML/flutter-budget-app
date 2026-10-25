import 'package:account_book/application/my_service.dart';
import 'package:account_book/domain/use_case/history_use_case/get_history_use_case.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_payments_use_case.dart';
import 'package:account_book/presentation/login/google_auth_helper.dart';
import 'package:account_book/style.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<MyService> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getHistoryUseCase = Get.put(GetHistoryUseCase());
    final getCategoriesUseCase = Get.put(GetCategoriesUseCase());
    final getPaymentsUseCase = Get.put(GetPaymentsUseCase());

    return Scaffold(
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
      const Text(
        "내돈어디가계",
        style: TextStyle(
            fontSize: 45, color: Color(0xff524D90), fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 260,
      ),
      MaterialButton(
          onPressed: () {
            // 웹 미리보기에서는 Google 로그인 대신 게스트로 시작한다.
            if (kIsWeb) {
              MyService.to.uid = 'guest';
              getCategoriesUseCase.invoke();
              getPaymentsUseCase.invoke();
              getHistoryUseCase.invoke();
              Get.offAndToNamed('/main');
              return;
            }
            const GoogleAuthHelper().loginAsGoogle(
                context: context,
                onSuccess: () {
                  getCategoriesUseCase.invoke();
                  getPaymentsUseCase.invoke();
                  getHistoryUseCase.invoke();
                  Get.offAndToNamed('/main');
                },
                onFailure: () =>
                    {Get.snackbar("Login failed!", "Can't login.")});
          },
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/image/bg_btn_google_login.png",
                  height: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  kIsWeb ? "Start as guest" : "Login as google",
                  style: TextStyle(fontSize: 20, color: AppColor.googleBlue),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ]))
      // This trailing comma makes auto-formatting nicer for build methods.
    ])));
  }
}
