import 'package:api_http_request/core/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'core/constant/keys.dart';
import 'core/theme/controller/theme_controller.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    String? storage = GetStorage().read(Keys.accessTokenKey);
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeController().themeDataGet,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      getPages: AppRoutes.routes,
      initialRoute: storage.toString().isEmpty || storage == null ? Routes.loginScreen : Routes.homeScreen,
    );
  }
}