import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/controller/profile_controller.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            profileController.isLoading
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: lightColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.loadingImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: lightColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: profileController.profilePhoto == null ||
                                profileController.profilePhoto!.isEmpty
                            ? AssetImage(AppImages.profileImage)
                                as ImageProvider
                            : NetworkImage(
                                profileController.profilePhoto ?? "",
                              ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              profileController.nameController.text,
              style: theme.headlineLarge,
            ),
            Text(
              profileController.emailController.text,
              style: theme.headlineSmall,
            ),
          ],
        ),
      );
    });
  }
}
