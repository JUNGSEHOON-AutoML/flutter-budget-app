import 'package:account_book/domain/use_case/get_history_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/model/me_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MeController());
    final test = Get.put(GetHistoryUseCase());
    test.invoke();
    return Scaffold(
        body: Center(child: GetBuilder<MeController>(builder: (meController) {
          return Text("${meController.me.displayName} 로그인 성공");
        })));
  }
}
