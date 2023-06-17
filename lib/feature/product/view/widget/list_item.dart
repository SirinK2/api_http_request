import 'package:api_http_request/core/theme/app_colors.dart';
import 'package:api_http_request/feature/product/logic/controller/product_controller.dart';
import 'package:api_http_request/feature/product/model/Products.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_form_dialog.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.data,
  });

  final Products? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: Get.width,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(data?.images.first ?? ""),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 8),
                child: DropDownMenu(data: data),
              )
            ],
          ),
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          data?.title ?? "",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      SizedBox(
                          width: Get.width,
                          child: Text(data?.description ?? "")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.data,
  });

  final Products? data;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Container(
          padding: const EdgeInsets.only(bottom: 4),
          width: 30,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200
          ),
          child: const Icon(
            Icons.more_horiz,
              size: 20,
          ),
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems(data).onChanged(context, value as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 120,
          direction: DropdownDirection.left,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            // color: Colors.redAccent,
          ),
          elevation: 8,
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48)
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  final Products? products;
  final controller = Get.find<ProductController>();

  MenuItems(this.products);

  static const List<MenuItem> firstItems = [edit, delete];

  static const edit = MenuItem(text: 'Edit', icon: Icons.edit);
  static const delete = MenuItem(text: 'Delete', icon: Icons.delete);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: blackColor, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: blackColor,
          ),
        ),
      ],
    );
  }

  onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.edit:
        Get.dialog(EditFormDialog(
          toDoModel: products,
        ));

        break;
      case MenuItems.delete:
        controller.deleteData('${products?.id}');
        break;
    }
  }
}
