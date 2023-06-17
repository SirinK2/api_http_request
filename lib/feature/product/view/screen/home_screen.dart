import 'package:api_http_request/feature/profile/logic/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_image.dart';
import '../../../../core/route/route.dart';
import '../../logic/controller/product_controller.dart';
import '../widget/form_dailog.dart';
import '../widget/list_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed(Routes.profileScreen);
            },
            child: GetBuilder<ProfileController>(
              builder: (profileController) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: profileController.profilePhoto == null || profileController.profilePhoto!.isEmpty
                          ? AssetImage(AppImages.profileImage)
                      as ImageProvider
                          : NetworkImage(
                        profileController.profilePhoto ?? "",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
            ),
          )
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(FormDialog());
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          width: Get.width * 0.95,
          height: Get.height,
          padding: const EdgeInsets.all(8),
          child: GetBuilder<ProductController>(
            builder: (controller) {
              return FutureBuilder(
                  future: controller.getAllProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data?[index];
                            return ListItem(
                              data: data);
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("THERE IS NO ITEMS"),
                        );
                      }
                    } else if(snapshot.hasError)
                    {
                      return Text(snapshot.error.toString());
                    }else {
                      return const Center(
                        child: Text("THERE IS NO ITEMS"),
                      );
                    }
                  });
            }
          )
        ),
      ),
    );
  }
}

/*
          child: GetBuilder<ProductController>(builder: (controller) {
            return FutureBuilder(
                future: controller.getAllProduct(),
                builder: (context, snapshot) {
                  print('snapshot.data?.length ${snapshot.data?.length}');
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data?[index];
                          return ListItem(
                              data: data, controller: controller,);
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("THERE IS NO ITEMS"),
                      );
                    }
                  } else if(snapshot.hasError)
                  {
                    return Text(snapshot.error.toString());
                  }else {
                    return const Center(
                      child: Text("THERE IS NO"),
                    );
                  }
                });
          }),

 */