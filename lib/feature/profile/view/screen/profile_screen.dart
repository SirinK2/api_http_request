import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/route/route.dart';
import '../../logic/controller/profile_controller.dart';
import '../widget/logout_widget.dart';
import '../widget/profile_header_widget.dart';
import '../widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 50),
                const ProfileHeaderWidget(),
                const SizedBox(height: 60),
                ProfileWidget(
                  text: 'Personal Information',
                  onTap: () {
                    Get.toNamed(Routes.personalInformation);
                  },
                ),
                LogOutWidget(
                  profileController: profileController,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
