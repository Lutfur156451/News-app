import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMyDialog(url, context) {
  // Replace with your image URL
  Get.dialog(ImageViewDialog(url));
}

class ImageViewDialog extends GetView {
  final String imageUrl;
  const ImageViewDialog(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  imageUrl,
                )),
            ElevatedButton(
              onPressed: () => Get.back(), // Close the dialog
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
