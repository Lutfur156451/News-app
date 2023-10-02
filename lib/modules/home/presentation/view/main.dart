import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/dimensions.dart';
import '../../../news/presentation/view/news_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _HomeState();
}

class _HomeState extends State<MainScreen> {
  int _currentIndex = 0;
  final _screens = <Widget>[
     const NewsScreen(),
     Container(),
     Container(),
     Container(),

  ];


  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: _icon(icon: CupertinoIcons.news),
          activeIcon: _icon(icon: CupertinoIcons.news_solid),
          label: AppString.text_news),
      BottomNavigationBarItem(
          icon: _icon(icon: CupertinoIcons.search),
          label: AppString.text_search),
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.notifications_outlined),
          label: AppString.text_notification),
      BottomNavigationBarItem(
          icon: _icon(icon: CupertinoIcons.settings),
          activeIcon: _icon(icon: CupertinoIcons.settings_solid),
          label: AppString.text_setting),
    ];


    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Localizations.override(
          context: context,
          child: Wrap(children: [
            BottomNavigationBar(
              selectedItemColor: AppColor.primaryColor,
              backgroundColor: Theme.of(context).cardColor,
              unselectedItemColor: AppColor.hintColor.withOpacity(0.8),
              type: BottomNavigationBarType.fixed,
              selectedFontSize: Dimensions.fontSizeDefault - 1,
              unselectedFontSize: Dimensions.fontSizeDefault - 1,
              showUnselectedLabels: true,
              items: items,
              elevation: 3,
              currentIndex: _currentIndex,
              onTap: (index) => onTap(index),
            )
          ]),
        ),
      ),
    );
  }


  Widget _icon({required icon}) {
    return Icon(icon);
  }








}

Future<bool> _onWillPop(BuildContext context) async {
  if (Platform.isAndroid) {
    SystemNavigator.pop();
  } else if (Platform.isIOS) {
    exit(0);
  }
  return false;
}