import 'package:account_book/di/me_controller.dart';
import 'package:account_book/domain/use_case/properties_use_case/get_categories_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MeController());
    final test = Get.put(GetCategoriesUseCase());

    test.invoke();

    return Scaffold(
        body: Center(child: GetBuilder<MeController>(builder: (meController) {
      return Text("${meController.me.displayName} 로그인 성공");
    })));
  }
}
