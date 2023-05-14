import 'dart:convert';
import 'package:api_http_request/constant/api_string.dart';
import 'package:api_http_request/model/local_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  
  final _client = http.Client();

  final Map<String, String> _headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  //GET request (List of data)
  Future<List<ToDoModel>> getAllData() async {
    try {
      final response = await _client.get(
        Uri.parse(ApiString.baseUrl),
        headers: _headers,
      );
      List result = jsonDecode(response.body);
      return result.map((todo) => ToDoModel.fromJson(todo)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get request
  Future<ToDoModel> getData({required String id}) async {
    try {
      final response = await _client.get(
        Uri.parse("${ApiString.baseUrl}/$id"),
        headers: _headers,
      );
      print(response.statusCode);

      Map<String, dynamic> result = jsonDecode(response.body);
      print(result.entries.first);
      return ToDoModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  //POST request
  Future<ToDoModel> postData(ToDoModel model) async {
    try {
      final body = jsonEncode({
        'title': model.title,
        'description': model.description,
        'date': model.date,
      });
      final response = await _client.post(
        Uri.parse(ApiString.baseUrl),
        headers: _headers,
        body: body,
      );
      print(response.statusCode);
      var result = jsonDecode(response.body);
      print(result);
      return ToDoModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  //PUT request
  Future<ToDoModel> updateData(ToDoModel model) async {
    try {
      final body = jsonEncode({
        'title': model.title,
        'description': model.description,
        'date': model.date,
      });
      final response = await _client.put(
        Uri.parse("${ApiString.baseUrl}/${model.id}"),
        headers: _headers,
        body: body,
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      return ToDoModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  deleteData(String id) async {
    try{
       await _client.delete(
        Uri.parse("${ApiString.baseUrl}/$id"),
      );
    }catch(e){
      throw Exception(e);
    }
  }
}
