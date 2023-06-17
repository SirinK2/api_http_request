import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../constant/keys.dart';

class TokenHandler implements InterceptorContract {
  GetStorage getStorage = GetStorage();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      var token = await getStorage.read(Keys.accessTokenKey);

      data.headers.clear();
      if (token != null || token.isNotEmpty) {
        bool hasExpired = JwtDecoder.isExpired(token);
        if (hasExpired) {
          Get.snackbar("You must login", "message");
        } else {
          data.headers['authorization'] = 'Bearer $token';
          data.headers['content-type'] = 'application/json';
        }
      } else {
        Get.snackbar("You must login", "message");
      }
    } catch (e) {
      Get.snackbar("Something went wrong ", "You must login");
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
