import '../../logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormDialog extends StatelessWidget {
  FormDialog({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

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
