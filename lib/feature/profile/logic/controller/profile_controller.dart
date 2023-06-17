import 'package:api_http_request/core/constant/keys.dart';
import 'package:api_http_request/core/route/route.dart';
import 'package:api_http_request/feature/profile/logic/service/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final ProfileService service = ProfileService();

  GetStorage authStorage = GetStorage();

  String? profilePhoto = '';

  bool isLoading = false;

  //Password icon
  bool isVisibility = false;

  //Personal Info
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //Change Password
  TextEditingController passwordController = TextEditingController();
  TextEditingController yourPasswordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  //fun for Password icon
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  @override
  onInit() async {
    super.onInit();
    await getUserInfo();
  }

  getUserInfo() async {
    await service.getUser(onDone: (value) async {
      nameController.text = value.name ?? "";
      emailController.text = value.email;
      passwordController.text = value.password ?? "";
      profilePhoto = value.avatar ?? "";
      await authStorage.write(Keys.userIdKey, value.id.toString());
      update();
    }, onError: (value) {
      Get.snackbar("title", "message");
    });
  }

  updateUserName() async {
    String id = authStorage.read(Keys.userIdKey);
    await service.updateUser(
        userId: id,
        onDone: () async {
          await getUserInfo();
          Get.back();
          Get.snackbar("Done", "user name updated successfully");
        },
        onError: (onError) {
          Get.snackbar("Error", onError);
        },
        name: nameController.text);
  }

  logOut() async {
    await authStorage.remove(Keys.accessTokenKey);
    await authStorage.remove(Keys.userIdKey);
    Get.offAllNamed(Routes.loginScreen);
  }
}
