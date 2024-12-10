// app/modules/login/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/controllers/auth_controller.dart';
import 'package:project_mobile/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/images/LOGO.png', height: 90),
              const SizedBox(height: 20),
              const Text(
                'Sign In Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: controller.cEmail,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.cPass,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("Reset Password"),
                  onPressed: () {
                    Get.offAllNamed(Routes.RESET_PASSWORD);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  cAuth.login(controller.cEmail.text, controller.cPass.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 17),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.SIGNUP);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Create New Account'),
              ),
            ], // Memastikan daftar widget diakhiri dengan tanda koma
          ),
        ),
      ),
    );
  }
}
