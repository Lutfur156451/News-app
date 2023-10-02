import 'package:flutter/material.dart';
import 'package:news_app/common/custom_app_bar.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(),
      body: const Center(child: Text("Setting Screen")),
    );
  }
}
