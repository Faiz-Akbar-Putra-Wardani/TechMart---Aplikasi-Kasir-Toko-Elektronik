// app/modules/reset_password/controllers/reset_password_controller.dart
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  //TODO: Implement ResetPasswordController
  final cEmail = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    super.onClose();
  }
}
