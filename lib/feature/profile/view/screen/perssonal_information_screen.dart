import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/controller/profile_controller.dart';
import '../widget/personal_information.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: Get.width,
              height: Get.height / 2,
              child: PersonalInformationWidget(
                profileController: profileController,
              )),
        ),
      );
    });
  }
}
