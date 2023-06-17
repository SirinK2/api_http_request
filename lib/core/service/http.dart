import 'dart:convert';
import '../../core/service/token.dart';
import 'package:http/http.dart' as https;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class Http {
  Http._();

  static Http get http => Http._();

  final _client = https.Client();

  static final _clientWithToken = InterceptedClient.build(
    interceptors: [TokenHandler()],
  );

  String? get _baseUrl => dotenv.env["BASE_URL"];

//GET request
  Future<https.Response> getRequest({
    required String? endpoint,
    Map<String, String>? headers,
  }) async {
    return await _client.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
    );
  }

  //GET request with token
  Future<https.Response> getRequestWithToken({
    required String? endpoint,
  }) async {
    return await _clientWithToken.get(
      Uri.parse('$_baseUrl/$endpoint'),
    );
  }

  //POST request
  Future<https.Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    return await _client.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  // POST request with token
  Future<https.Response> postRequestWithToken({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    return await _clientWithToken.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: body,
    );
  }

  //PUT request
  Future<https.Response> updateRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    return await _client.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

//PUT request with token
  Future<https.Response> updateRequestWithToken({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    return await _clientWithToken.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: jsonEncode(body),
    );
  }

//Delete request
  Future<https.Response> deleteRequest({
    required String endpoint,
  }) async {
    return await _client.delete(Uri.parse('$_baseUrl/$endpoint'));
  }

  //Delete request with token

  Future<https.Response> deleteRequestWithToken({
    required String endpoint,
  }) async {
    return await _clientWithToken.delete(Uri.parse('_baseUrl/$endpoint'));
  }
}
