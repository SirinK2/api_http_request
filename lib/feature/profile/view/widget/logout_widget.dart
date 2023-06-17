import 'package:flutter/material.dart';
import '../../../../common/widget/dialoge_widget.dart';
import '../../logic/controller/profile_controller.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key, required this.profileController})
      : super(key: key);
  final ProfileController profileController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return DialogWidget(
      title: 'Please Confirm',
      content: "Are You Sure To LogOut",
      textButton: 'Logout',
      onPressed: () async {
        await profileController.logOut();
      },
      child: Row(
        children: [
          Text(
            "Logout",
            style: theme.headlineMedium,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.logout,
          ),
        ],
      ),
    );
  }
}
