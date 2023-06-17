import 'package:api_http_request/feature/auth/logic/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/route/route.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Login',
        )),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 390,
              height: 600,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Text(
                      'Login',
                      style: theme.bodyLarge,
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    TextField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.loginUser();
                      },
                      child: const Text('Login'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: theme.headlineSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child: Text(
                            'Sign Up',
                            style: theme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
