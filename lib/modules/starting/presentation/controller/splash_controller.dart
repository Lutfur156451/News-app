import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), ()=>chooseScreen());
  }

  Future chooseScreen() async {
    await Get.toNamed(Routes.MAIN);
  }
}