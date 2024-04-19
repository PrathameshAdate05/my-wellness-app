import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_wellness_mobile/modules/home/home_bindings.dart';
import 'package:my_wellness_mobile/modules/home/home_screen.dart';
import 'package:my_wellness_mobile/modules/login/login_bindings.dart';
import 'package:my_wellness_mobile/modules/login/login_screen.dart';
import 'package:my_wellness_mobile/modules/splash/splash_bindings.dart';
import 'package:my_wellness_mobile/modules/splash/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const SPLASH = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: Routes.LOGIN,
    //   page: () => LoginScreen(),
    //   binding: LoginBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.DASHBOARD,
    //   page: () => DashboardScreen(),
    //   binding: DashboardBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.CHAT_USER_LIST,
    //   page: () => ChatUserListScreen(),
    //   binding: ChatUserListBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.APPOINTMENT_USER_LIST,
    //   page: () => AppointmentUserListScreen(),
    //   binding: AppointmentUserListBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.REGISTRATION_ONE,
    //   page: () => RegistrationOneScreen(),
    //   binding: RegistrationOneBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.REGISTRATION_TWO,
    //   page: () => RegistrationTwoScreen(),
    //   binding: RegistrationTwoBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
    // GetPage(
    //   name: Routes.REGISTRATION_THREE,
    //   page: () => RegistrationThreeScreen(),
    //   binding: RegistrationThreeBinding(),
    //   transition: Transition.fadeIn,
    //   transitionDuration: const Duration(seconds: 1),
    // ),
  ];
}
