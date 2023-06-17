import 'package:api_http_request/feature/auth/view/screen/login_screen.dart';
import 'package:api_http_request/feature/auth/view/screen/sign_up_screen.dart';
import 'package:api_http_request/feature/profile/view/screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../feature/product/view/screen/home_screen.dart';
import '../../feature/profile/view/screen/perssonal_information_screen.dart';
import '../binding/binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: Binding(),
    ),
    GetPage(
        name: Routes.profileScreen,
        page: () => const ProfileScreen(),
        binding: Binding()),

    GetPage(
        name: Routes.personalInformation,
        page: () => const PersonalInformationScreen(),
        binding: Binding()),
  ];
}

class Routes {
  static const signUpScreen = '/sign_up_screen';
  static const loginScreen = '/login_screen';
  static const homeScreen = '/home_screen';
  static const profileScreen = '/profile_screen';
  static const personalInformation = '/personal_information';

}
