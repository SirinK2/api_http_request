import 'dart:convert';
import 'package:api_http_request/constant/api_string.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final _client = http.Client();

  //GET request
  getData({required String url, required Map<String, String> headers}) async {
    try {
      final response = await _client.get(
        Uri.parse(url),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  //POST request
  postData({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(ApiString.baseUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  //PUT request
  updateData({
    required String url,
    required String id,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      final response = await _client.put(
        Uri.parse("$url/$id"),
        headers: headers,
        body: jsonEncode(body),
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteData({
    required String url,
    required String id,
   }) async {
    try {
      await _client.delete(
        Uri.parse("$url/$id"),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
