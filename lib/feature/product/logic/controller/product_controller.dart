import 'dart:developer';
import 'package:api_http_request/feature/product/logic/service/product_service.dart';
import 'package:api_http_request/feature/product/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductService service = ProductService();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  ScrollController scrollController = ScrollController();

  refreshData() {
    getAllProduct();
    update();
  }

  clearController() {
    titleController.clear();
    descriptionController.clear();
  }

  Future<List<Products>> getAllProduct() async {
    List<Products> list = [];
    await service.getAllProduct(
      onDone: (value) {
        list.addAll(value);
      },
      onError: (String value) {},
    );
    return list;
  }

  createProduct() async {
    var product = Products(
      title: titleController.text,
      description: descriptionController.text,
      price: int.parse(priceController.text),
      images: ["https://placeimg.com/640/480/any"],
      categoryId: 1,
    );
    await service.createProduct(
        model: product,
        onDone: (value) async {
          Get.back();
          await refreshData();
          clearController();
        },
        onError: (String value) {
          Get.snackbar("title", "message $value");
          log(value.toString());
        });
  }

  updateData({required Products model}) async {
    await service.updateProduct(
        model: model,
        onDone: () async {
          await refreshData();
        },
        onError: (String value) {
          Get.snackbar("title", value);
        },
        onFinally: () {
          Get.back();
        });
  }

  deleteData(String id) async {
    await service.deleteProduct(
        id: id,
        onDone: (value) {
          refreshData();
        },
        onError: (String value) {
          Get.snackbar("title", value);
        },
        onFinally: () {});
  }
}
