import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/custom_app_bar.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_layout.dart';
import 'package:news_app/utils/dimensions.dart';
import '../../../../common/custom_spacer.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/image.dart';
import '../widgets/dialog_widget.dart';

class NewsDetailsScreen extends StatefulWidget {
  final String? title;
  final String? image;
  final String? date;
  final String? content;

  const NewsDetailsScreen(
      {super.key, this.content, this.image, this.title, this.date});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppbar(isLeading: true,),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            _imageLayout(context),
            _contentLayout(
                context: context,
                title: widget.title,
                content: widget.content,
                date: widget.date),
          ],
        ),
      ),
    );
  }

  _contentLayout({date, title, content, context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSpacerHeight(height: 8),
          Text(
            "$date",
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault),
          ),
          customSpacerHeight(height: 8),
          Text(
            '$title',
            style: GoogleFonts.poppins(
                fontSize: Dimensions.fontSizeExtraDefault + 2,
                fontWeight: FontWeight.w700,
                color: AppColor.normalTextColor),
          ),
          customSpacerHeight(height: 12),
          _descriptionText(context: context, drcText: "$content")
        ],
      ),
    );
  }

  _descriptionText({required context, required String drcText}) {
    return Text(
      drcText,
      style: _disTextStyle(context),
    );
  }

  _imageLayout(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => showMyDialog(widget.image, context),
          child: SizedBox(
              height: AppLayout.getHeight(380),
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.image.toString(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    Images.PLACEHOLDER,
                    fit: BoxFit.cover,
                  );
                },
              )),
        ),
        const Positioned(
            bottom: 12,
            right: 12,
            child: Icon(
              CupertinoIcons.share,
              color: AppColor.cardColor,
            )),
        const Positioned(
            bottom: 12,
            right: 60,
            child: Icon(
              Icons.share,
              color: AppColor.cardColor,
            )),
      ],
    );
  }
}

TextStyle _disTextStyle(context) {
  return GoogleFonts.poppins(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault);
}
