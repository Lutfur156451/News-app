import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;
  bool isExpanded = false;

  @override
  void initState() {
    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(101, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf == ""
        ? RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text,
            style: _disTextStyle(context),
          ),
        ],
      ),
    )
        : RichText(
      text: TextSpan(
        children: [
          // half text layout here
          _halfText(),
          TextSpan(
            text: isExpanded ? " Read less" : " ... Read more",
            style: AppStyle.normal_text_black.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });

                //_readMoreText();
              },
          ),
        ],
      ),
    );
  }

  _halfText() {
    return  TextSpan(
      text: isExpanded ? widget.text : firstHalf,
      style: _disTextStyle(context),
    );
  }
}

TextStyle  _disTextStyle(context) {
  return GoogleFonts.poppins(
      color: AppColor.normalTextColor.withOpacity(0.6),
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault);
}