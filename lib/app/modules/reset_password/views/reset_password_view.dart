// app/modules/reset_password/views/reset_password_view.dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/controllers/auth_controller.dart';
import 'package:project_mobile/app/routes/app_pages.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/images/LOGO.png',
              height: 90,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cEmail,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.resetPassword(controller.cEmail.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 38, 3, 94),
                foregroundColor: Colors.white,
              ),
              child: Text("Reset Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Kembali Ke login"),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  child: const Text("Klik Ini"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
