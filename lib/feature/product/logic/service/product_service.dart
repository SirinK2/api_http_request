import 'dart:convert';
import 'package:api_http_request/feature/product/model/Products.dart';
import 'package:http/http.dart';
import '../../../../core/service/http.dart';
import '../../../../core/constant/endpoint.dart';

//?offset=0&limit=10
class ProductService {
  getAllProduct({
    required Function(List<Products> value) onDone,
    required Function(String value) onError,
  }) async {
    try {
      Response response = await Http.http.getRequest(
        endpoint: "${Endpoint.products}/",
      );
      if (response.statusCode.toString().startsWith('2')) {
        List result = await jsonDecode(response.body);
        List<Products> a = result.map((e) => Products.fromJson(e)).toList();
        onDone(a);
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

  createProduct({
    required Products model,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
  }) async {
    try {
      Response response =
          await Http.http.postRequest(endpoint: "${Endpoint.products}/", body: {
        'title': model.title,
        'description': model.description,
        'price': model.price,
        'categoryId': model.categoryId,
        'images': model.images
      }, headers: {
        'Content-Type': 'application/json'
      });
      if (response.statusCode.toString().startsWith('2')) {
        onDone(response.body);
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

  updateProduct({
    required Products model,
    required Function() onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.updateRequest(
        endpoint: "${Endpoint.products}/${model.id}",
        body: {
          'title': model.title,
          'description': model.description,
        },
        headers: {'Content-Type': 'application/json'},
      );
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
    } finally {
      onFinally();
    }
  }

  deleteProduct({
    required String id,
    required Function(dynamic value) onDone,
    required Function(String value) onError,
    required Function() onFinally,
  }) async {
    try {
      Response response = await Http.http.deleteRequest(
        endpoint: "${Endpoint.products}/$id",
      );
      if (response.statusCode.toString().startsWith('2')) {
        onDone(response.body);
      }
      if (response.statusCode.toString().startsWith('4')) {
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
