import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'modules/news/presentation/controller/news_controller.dart';
import 'modules/starting/presentation/controller/splash_controller.dart';


Future<void> initApp() async {

  WidgetsFlutterBinding.ensureInitialized();

  Get.put(SplashController(), permanent: true);
  Get.put(NewsController(), permanent: true);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

}