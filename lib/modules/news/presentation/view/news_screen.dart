import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/custom_spacer.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_layout.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/dimensions.dart';
import '../../../../common/custom_app_bar.dart';
import '../../../../utils/image.dart';
import '../../../../utils/utils.dart';
import '../controller/news_controller.dart';
import '../widgets/loader_widget.dart';
import '../widgets/read_more_widget.dart';
import 'package:intl/intl.dart';

import 'news_details.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller.getNewsApi();
    return Scaffold(
      appBar: CustomAppbar(),
      backgroundColor: AppColor.backgroundColor,
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customSpacerHeight(height: 2),
                _newsFilterLayout(),
                customSpacerHeight(height: 12),
                controller.obx((state) => _newsLayoutView(context),
                    onLoading: const Expanded(child: SimmerList()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _newsFilterLayout() {
    var currentIndex = 0.obs;
    return Center(
      child: Wrap(
          children: List.generate(filterList.length, (index) {
        return SizedBox(
          height: AppLayout.getHeight(54),
          width: AppLayout.getWidth(120),
          child: Obx(() => GestureDetector(
              onTap: () {
                currentIndex.value = index;

                switch (index) {
                  case 0:
                    controller.getNewsApi();
                    break;
                  case 1:
                    controller.getNewsApi();
                    break;
                  case 2:
                    controller.getNewsApi();
                    break;
                }
              },
              child: currentIndex.value == index
                  ? _selected(index)
                  : _unselected(index))),
        );
      })),
    );
  }

  _unselected(int index) {
    return Card(
      color: AppColor.cardColor,
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Center(
          child: Text(
        filterList[index],
        style: AppStyle.mid_large_text.copyWith(
            fontSize: Dimensions.fontSizeMid - 3,
            color: AppColor.normalTextColor),
      )),
    );
  }

  _selected(int index) {
    return Card(
      color: AppColor.primaryColor,
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Center(
          child: Text(
        filterList[index],
        style: AppStyle.mid_large_text
            .copyWith(fontSize: Dimensions.fontSizeMid - 3),
      )),
    );
  }

  _descriptionText({drcText, context}) {
    final wordCount = drcText.split(' ').length;

    return wordCount > 8
        ? ExpandedText(
            text: drcText,
          )
        : Text(
            drcText,
            style: GoogleFonts.poppins(color: AppColor.primaryColor),
          );
  }

  _newsLayoutView(context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.newsModel.articles?.length,
        itemBuilder: (context, index) {
          var news = controller.newsModel.articles?[index];

          String apiDate = news?.publishedAt ?? "";
          DateTime parsedDate = DateTime.parse(apiDate);
          String formattedDate =
              DateFormat.yMMMMd('en_US').add_jm().format(parsedDate);

          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsScreen(
                    title: news?.title,
                    content: news?.content + " " + news?.description,
                    date: formattedDate,
                    image: news?.urlToImage,
                  ),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _newsImage(image: news?.urlToImage ?? "", context: context),
                _contentLayout(
                    context: context,
                    date: formattedDate,
                    content: news?.description ?? "",
                    title: news?.title ?? "")
              ],
            ),
          );
        },
      ),
    );
  }

  _newsImage({image, context}) {
    return SizedBox(
        height: AppLayout.getHeight(200),
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              Images.PLACEHOLDER,
              fit: BoxFit.cover,
            );
          },
        ));
  }

  _contentLayout({date, title, content, context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSpacerHeight(height: 4),
          Text(
            "$date",
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontWeight: FontWeight.w200,
                fontSize: Dimensions.fontSizeDefault),
          ),
          customSpacerHeight(height: 6),
          Text(
            '$title',
            style: GoogleFonts.poppins(
                fontSize: Dimensions.fontSizeExtraDefault + 1,
                fontWeight: FontWeight.w500,
                color: AppColor.normalTextColor),
          ),
          customSpacerHeight(height: 12),
          _descriptionText(context: context, drcText: "$content")
        ],
      ),
    );
  }

  Future<void> _refreshPage() async {
    await controller.getNewsApi();
  }
}
