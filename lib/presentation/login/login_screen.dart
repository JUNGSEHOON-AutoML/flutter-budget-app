import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/login/google_auth_helper.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/model/me_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MeController());

    return Scaffold(
      body: Center(child: GetBuilder<MeController>(builder: (meController) {
        return MaterialButton(
            onPressed: () {
              const GoogleAuthHelper().loginAsGoogle(
                  context: context,
                  meController: meController,
                  onSuccess: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoryScreen()))
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
                    style: TextStyle(fontSize: 20, color: AppColor.googleBlue),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ]));
      })), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
