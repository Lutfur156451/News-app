import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/image.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatelessWidget {
  final image;
  const ViewImageScreen({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          image==null? Center(child: Image.asset(
            Images.PLACEHOLDER,
            fit: BoxFit.cover,
          )):
          PhotoView(imageProvider: NetworkImage(image), errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              Images.PLACEHOLDER,
              fit: BoxFit.cover,
            );
          },),
          Positioned(
              top: 54,
              left: 6,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Card(
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.primaryColor,
                      ),
                    )),
              )),
          const Positioned(
              top: 54,
              right: 12,
              child: Icon(
                Icons.share,
                color: AppColor.cardColor,
              )),
          const Positioned(
              top: 54,
              right: 62,
              child: Icon(
                CupertinoIcons.share,
                color: AppColor.cardColor,
              )),
        ],
      ),
    );
  }
}
