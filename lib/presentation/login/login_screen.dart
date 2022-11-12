import 'package:account_book/presentation/history/history_screen.dart';
import 'package:account_book/presentation/login/google_auth_helper.dart';
import 'package:account_book/style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          child: MaterialButton(
              onPressed: () {
                GoogleAuthHelper().loginAsGoogle(
                    context: context,
                    onSuccess: () => {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HistoryScreen()))
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
              ]))), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
