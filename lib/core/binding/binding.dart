import 'package:api_http_request/feature/auth/logic/controller/auth_controller.dart';
import 'package:api_http_request/feature/profile/logic/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../feature/product/logic/controller/product_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => ProfileController());
  }

}