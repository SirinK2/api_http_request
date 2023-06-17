import 'dart:convert';
import 'package:api_http_request/core/constant/endpoint.dart';
import '../../../../common/model/user.dart';
import 'package:http/http.dart';
import '../../../../core/service/http.dart';

class AuthService {
  createUser({
    required User user,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
        endpoint: "${Endpoint.users}/",
        body: user.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode.toString().startsWith('2')) {
        var result = await jsonDecode(response.body);
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {
        onError("Client error");
      } else if (response.statusCode.toString().startsWith('5')) {
        onError("Server error");
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }

  // Future<bool> checkEmail({required String email}) async {
  //   var response = await Http.http.postRequest(
  //     endpoint: "${Endpoint.users}/is-available",
  //     body: {"email": email},
  //   );
  //   var isAvailable = jsonDecode(response.body);
  //   return isAvailable["isAvailable"];
  // }

  loginUser({
    required User user,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.postRequest(
          endpoint: "${Endpoint.auth}/login",
          body: {
            "email": user.email,
            "password": user.password,
          },
          headers: {
            'Content-Type': 'application/json'
          }
          );

      if (response.statusCode.toString().startsWith('2')) {
        var result = await jsonDecode(response.body);
        onDone(result);
      } else if (response.statusCode.toString().startsWith('4')) {
        onError("Client error");
      } else if (response.statusCode.toString().startsWith('5')) {
        onError("Server error");
      }
    } catch (e) {
      onError(e.toString());
    } finally {
      onFinally();
    }
  }
}
