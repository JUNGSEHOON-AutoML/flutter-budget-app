import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/model/me_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MeController());

    return Scaffold(
        body: Center(child: GetBuilder<MeController>(builder: (meController) {
            return Text("${meController.me.displayName} 로그인 성공");
    })));
  }
}
