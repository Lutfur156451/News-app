import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/news/presentation/controller/news_controller.dart';
import 'package:shimmer/shimmer.dart';

class SimmerList extends StatelessWidget {
  const SimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: List.generate(Get.find<NewsController>().newsModel.articles?.length??4, (index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white12,
            enabled: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: const Card()),

                SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    height: 20,
                    child: const Card()),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    child: const Card()),   SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    child: const Card()),

              ],
            ),
          );
        }),
      ),
    );
  }
}