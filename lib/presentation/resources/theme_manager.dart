import 'package:flutter/material.dart';
import 'package:fromto/presentation/resources/color_manager.dart';
import 'package:fromto/presentation/resources/font_manager.dart';
import 'package:fromto/presentation/resources/style_manager.dart';
import 'package:responsive_screen_utils/responsive_screenutil.dart';

ThemeData themeManager() {
  return ThemeData(

    //main colors

    primaryColor: ColorManager.primaryColor,




    //text selection theme
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: ColorManager.blue,
      cursorColor: ColorManager.hintInFormField,
      selectionHandleColor: ColorManager.white,
    ),
    scaffoldBackgroundColor: ColorManager.white,

    //text form field
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: lightStyleManager(color:ColorManager.grey,fontSize:20),
        focusColor: ColorManager.backGroundColor,
        focusedBorder: const UnderlineInputBorder(),

        filled: true,
        fillColor: ColorManager.backGroundColor,
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.errorColor))),


    //text theme
    textTheme: TextTheme(
      headlineLarge: boldStyleManager(
          color: ColorManager.black, fontSize: 40),
      bodyLarge: semiBoldStyleManager(
          color: ColorManager.black, fontSize: 25),

      headlineMedium: regularStyleManager(color: ColorManager.grey,fontSize:20),
      headlineSmall: lightStyleManager(color:ColorManager.grey,fontSize: 20,height: 1.5),
    ),

    //elevatedButtonTheme
    elevatedButtonTheme:  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          textStyle: const TextStyle(
            color: ColorManager.white,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15))),
    )

  );
}
