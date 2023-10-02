import 'package:flutter/material.dart';
import 'package:news_app/common/custom_app_bar.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(),
      body: const Center(child: Text("Notification Screen")),
    );
  }
}
