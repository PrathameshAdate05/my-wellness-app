import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_wellness_mobile/modules/login/login_bindings.dart';
import 'package:my_wellness_mobile/modules/login/login_screen.dart';
import 'package:my_wellness_mobile/modules/prescriptions_list/prescriptions_bindings.dart';
import 'package:my_wellness_mobile/modules/prescriptions_list/prescriptions_screen.dart';
import 'package:my_wellness_mobile/modules/prescritption_detail/prescription_detail_bindings.dart';
import 'package:my_wellness_mobile/modules/prescritption_detail/prescription_detail_screen.dart';
import 'package:my_wellness_mobile/modules/profile/profile_bindings.dart';
import 'package:my_wellness_mobile/modules/profile/profile_screen.dart';
import 'package:my_wellness_mobile/modules/record_details/record_details_bindings.dart';
import 'package:my_wellness_mobile/modules/record_details/record_details_screen.dart';
import 'package:my_wellness_mobile/modules/records/records_bindings.dart';
import 'package:my_wellness_mobile/modules/records/records_screen.dart';
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
      name: Routes.RECORDS,
      page: () => RecordsScreen(),
      binding: RecordsBinding(),
    ),
    GetPage(
      name: Routes.RECORD_DETAILS,
      page: () => RecordDetialsScreen(),
      binding: RecordDetailsBinding(),
    ),
    GetPage(
      name: Routes.PRESCRIPTION_DETAILS,
      page: () => PrescriptionDetailScreen(),
      binding: PrescriptionDetailBinding(),
    ),
    GetPage(
      name: Routes.PRESCRIPTIONS,
      page: () => PrescriptionsScreen(),
      binding: PrescriptionsBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
