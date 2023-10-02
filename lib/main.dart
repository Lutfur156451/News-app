import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_page.dart';
import 'package:news_app/utils/theme.dart';

import 'init_app.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}