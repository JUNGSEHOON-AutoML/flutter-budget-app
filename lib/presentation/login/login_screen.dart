import 'package:account_book/di/my_service.dart';
import 'package:account_book/domain/use_case/history_use_case/get_history_use_case.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_payments_use_case.dart';
import 'package:account_book/presentation/login/google_auth_helper.dart';
import 'package:account_book/style.dart';
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
            child: MaterialButton(
                onPressed: () {
                  const GoogleAuthHelper().loginAsGoogle(
                      context: context,
                      onSuccess: () {
                        getCategoriesUseCase.invoke();
                        getPaymentsUseCase.invoke();
                        getHistoryUseCase.invoke();
                        Get.offAndToNamed('/history');
                      },
                      onFailure: () => {print("Failed to login")});
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
                        height: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Login as google",
                        style:
                            TextStyle(fontSize: 20, color: AppColor.googleBlue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]))
            // This trailing comma makes auto-formatting nicer for build methods.
            ));
  }
}
