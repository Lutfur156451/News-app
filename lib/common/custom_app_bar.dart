import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_layout.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  bool isLeading;
   CustomAppbar({Key? key,this.isLeading=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: .5,
      backgroundColor: AppColor.primaryColor,
      leading: Padding(
        padding: leadingEdgeInsets,
        child: isLeading !=true?


        _leadingIcon():IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppColor.cardColor,)),
      ),
      centerTitle: true,
      title: _appName(),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              padding: iconButtonEdgeInsets,
              onPressed: () async {},
              icon: icon,
            ),
          ],
        ),
      ],
      elevation: .0,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 46);

  _appName() {
    return Padding(
      padding: leadingEdgeInsets,
      child: Text(
        "News ",
        style: AppStyle.title_text.copyWith(color: AppColor.cardColor),
      ),
    );
  }
}

_leadingIcon() {
  return Icon(
    CupertinoIcons.person_alt_circle,
    color: AppColor.cardColor,
    size: Dimensions.fontSizeDoubleLarge,
  );
}

EdgeInsets get leadingEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(18), bottom: AppLayout.getHeight(8));
}

EdgeInsets get iconButtonEdgeInsets {
  return EdgeInsets.only(bottom: AppLayout.getHeight(8));
}

Stack get icon {
  return Stack(
    children: [
      GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.notifications_none,
          color: AppColor.cardColor,
          size: Dimensions.fontSizeExtraLarge + 6,
        ),
      ),
      Positioned(right: 3, child: circleIcon)
    ],
  );
}

Icon get circleIcon {
  return Icon(
    Icons.circle,
    color: Colors.red,
    size: AppLayout.getHeight(10),
  );
}
