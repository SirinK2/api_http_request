import 'package:api_http_request/core/route/route.dart';
import 'package:api_http_request/feature/auth/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              'Sign up',
              style: theme.bodyLarge,
            ),
            const SizedBox(height: 50),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 30,
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.createUser();
              },
              child: const Text("Sign up"),
            ),
            Row(
              children: [
                const Text("Have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: Text(
                    'Login',
                    style: theme.bodySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
