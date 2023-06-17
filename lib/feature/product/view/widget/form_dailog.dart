import '../../logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDialog extends StatelessWidget {
  FormDialog({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

/*
"title": "New Product",
  "price": 10,
  "description": "A description",
  "categoryId": 1,
  "images": ["https://placeimg.com/640/480/any"]
}
 */
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Product'),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: controller.priceController,
              decoration: const InputDecoration(hintText: 'Price'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () async {
            await controller.createProduct();
          },
        ),
      ],
    );
  }
}
