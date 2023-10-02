import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_layout.dart';
import 'package:news_app/utils/app_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_appNameLayout(), _loader()],
      ),
    );
  }

  _appNameLayout() {
    return Center(
        child: Text(
      "News App",
      style: AppStyle.title_text.copyWith(color: AppColor.cardColor),
    ));
  }

  _loader() {
    return Container(
      height: AppLayout.getHeight(30),
      width: AppLayout.getWidth(30),
      margin: const EdgeInsets.only(top: 18),
      child: const CircularProgressIndicator(
        color: AppColor.cardColor,
        backgroundColor: AppColor.hintColor,
      ),
    );
  }
}
