import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/utils/app_colors.dart';


ThemeData get appTheme => _themeData;

ThemeData _themeData = ThemeData(
  appBarTheme: const AppBarTheme(

    iconTheme: IconThemeData(color: Colors.black),
    color: Colors.deepPurpleAccent,
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
    ),),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColor.primaryColor,
  ),

);