import 'package:api_http_request/core/constant/keys.dart';
import 'package:api_http_request/core/route/route.dart';
import 'package:api_http_request/feature/auth/logic/service/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/model/user.dart';

class AuthController extends GetxController {
  AuthService service = AuthService();
  GetStorage storage = GetStorage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  loginUser() async {
    isLoading = true;
    await service.loginUser(
        user: User(
          email: emailController.text,
          password: passwordController.text,
        ),
        onDone: (value) async {
          await storage.write(Keys.accessTokenKey, value["access_token"]);
          Get.offAllNamed(Routes.homeScreen);
        },
        onError: (String value) {
          Get.snackbar("Something went wrong", value);
        },
        onFinally: () {
          isLoading = false;
        });
  }

  createUser() async {
    var user = User(
      email: emailController.text,
      name: nameController.text,
      password:passwordController.text,
      avatar: "https://placeimg.com/640/480/any",
    );
    // bool isAvailable = await service.checkEmail(email: user.email);
    // if (!isAvailable) {
      await service.createUser(
        user: user,
        onDone: (value) {
          Get.offAllNamed(Routes.loginScreen);
        },
        onError: (value) {
          Get.snackbar("Something went wrong", value);
        },
        onFinally: () {
          // Do something
        },
      );
    // }
  }
}
