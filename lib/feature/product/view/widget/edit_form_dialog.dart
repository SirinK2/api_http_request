import 'package:api_http_request/feature/product/model/Products.dart';
import '../../logic/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/category.dart';

class EditFormDialog extends StatelessWidget {
  EditFormDialog({Key? key, required this.toDoModel}) : super(key: key);
  final Products? toDoModel;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = toDoModel!.title;
    controller.descriptionController.text = toDoModel!.description;

    return AlertDialog(
      title: const Text('Edit item'),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
            ),
            TextField(
              controller: controller.descriptionController,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () async {
            var data = Products(
              id: toDoModel!.id,
              title: controller.titleController.text,
              description: controller.descriptionController.text,
              price: 0,
              category: Category(id: 9, name: '', image: ''),
              images: [],
            );
            await controller.updateData(model: data);
          },
        ),
      ],
    );
  }
}
