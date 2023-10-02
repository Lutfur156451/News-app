import 'package:flutter/material.dart';
import 'package:news_app/common/custom_app_bar.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(),
      body: const Center(child: Text("Search Screen")),
    );
  }
}
