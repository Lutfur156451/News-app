import 'package:get/get.dart';
import '../modules/home/presentation/view/main.dart';
import '../modules/starting/presentation/view/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH_SCREEN;
  static final routes = [
    GetPage(
      name: Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),   GetPage(
      name: Paths.MAIN,
      page: () => const MainScreen(),
    ),

  ];
}