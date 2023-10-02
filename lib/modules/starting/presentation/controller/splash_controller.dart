import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';


class SplashController extends GetxController {
  @override
  void onReady() {
     Future.delayed(const Duration(milliseconds: 1200), ()=>chooseScreen());
    super.onReady();
  }

  Future chooseScreen() async {
    await Get.toNamed(Routes.MAIN);
  }
}