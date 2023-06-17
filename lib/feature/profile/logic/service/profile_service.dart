import 'dart:convert';
import 'package:api_http_request/common/model/user.dart';
import 'package:http/http.dart';
import '../../../../core/service/http.dart';
import '../../../../core/constant/endpoint.dart';

class ProfileService {
  getUser({
    required Function(User value) onDone,
    required Function(String value) onError,
  }) async {
    try {
      Response response = await Http.http
          .getRequestWithToken(endpoint: "${Endpoint.auth}/profile");

      if (response.statusCode.toString().startsWith('2')) {
        var result = await jsonDecode(response.body);
        User user = User.fromJson(result);
        onDone(user);
      }
      if (response.statusCode.toString().startsWith('4')) {
        onError("Client error");
      } else if (response.statusCode.toString().startsWith('5')) {
        onError("Server error");
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  updateUser({
    required String userId,
    required String name,
    required Function() onDone,
    required Function(String value) onError,
  }) async {
    try {
      Response response = await Http.http.updateRequest(
          endpoint: "${Endpoint.users}/$userId", body: {'name': name},
          headers: {'Content-Type': 'application/json'});


    if (response.statusCode.toString().startsWith('2')) {
    onDone();
    }
    if (response.statusCode.toString().startsWith('4')) {
    onError("Client error");
    } else if (response.statusCode.toString().startsWith('5')) {
    onError("Server error");
    }
    } catch (e) {
    onError(e.toString());
    }
  }
}
