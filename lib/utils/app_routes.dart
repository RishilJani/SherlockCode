import 'package:cipher_decoder/encrypt_decrypt/e_d_2/enc_view.dart';
import 'package:cipher_decoder/utils/string_constants.dart';
import 'package:get/get.dart';
import '../about_us/new_about_us.dart';
import '../dashboard/dashboard.dart';
import '../dashboard/splash_screen.dart';
import '../encrypt_decrypt/dashboard_encrypt_decrypt.dart';
import '../feedback/feedback_screen.dart';
import '../main_navigation_screen/main_navigation_screen.dart';

class AppRoutes {
  static String InitialRoute = RT_SPLASH_SCREEN;
  static var pages = [
    GetPage(name: RT_SPLASH_SCREEN, page: () => MySplashScreen()),
    GetPage(name: RT_FEEDBACK_SCREEN, page: () => FeedbackScreen(),transition: Transition.fade),
    GetPage(name: RT_ABOUT_US_SCREEN, page: () => NewAboutUs(),transition: Transition.fade),

    GetPage(name: RT_MAIN_SCREEN, page: () => const MainNavigationScreen()),

    GetPage(name: RT_DASHBOARD, page: () => const Dashboard(),),
    GetPage(name: RT_DASHBOARD_ENCRYPT_DECRYPT,  page: () => const DashboardEncryptDecrypt(),),


    GetPage(name: RT_ENCRYPTION_VIEW2 , page: () => Enc_View() ),
  ];
}
