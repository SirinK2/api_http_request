import 'package:flutter/material.dart';
import '../../../../common/widget/text_field_widget.dart';
import '../../logic/controller/profile_controller.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({Key? key, required this.profileController})
      : super(key: key);
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 50),
          Text(
            'Personal Information',
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 50),
          TextFieldWidget(
            controller: profileController.nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person,
            ),
            label: 'Name',
          ),
          TextFieldWidget(
            enabled: false,
            controller: profileController.emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email,
            ),
            label: 'Email',
          ),
          ElevatedButton(
              onPressed: () async {
                await profileController.updateUserName();
              },
              child: const Text('Edit')),
        ]);
  }
}
