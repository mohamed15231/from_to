import 'package:flutter/material.dart';
import 'package:fromto/presentation/resources/font_manager.dart';

TextStyle _textStyleManager({
  required FontWeight fontWeight,
  required Color color,
  required double size,
  double? height,
}){
  return TextStyle(
    fontSize:size,
    fontWeight: fontWeight,
    color: color,
    height: height
  );
}

TextStyle regularStyleManager({
  required Color color,
  double fontSize=FontSizeManager.s12,
  double? height,
}){
  return _textStyleManager(
      color: color,
      fontWeight: FontWeightManager.regular,
      size: fontSize,
      height:height
  );
}

TextStyle boldStyleManager({
  required Color color,
   double? height,
  double fontSize=FontSizeManager.s12,
}){
  return _textStyleManager(
      color: color,
      fontWeight: FontWeightManager.bold,
      size: fontSize,
      height:height
  );
}

TextStyle semiBoldStyleManager({
  required Color color,
  double fontSize=FontSizeManager.s12,
  double? height
}){
  return _textStyleManager(
      color: color,
      fontWeight: FontWeightManager.semiBold,
      size: fontSize,
    height: height
  );
}

TextStyle lightStyleManager({
  required Color color,
  double fontSize=FontSizeManager.s12,
  double? height
}){
  return _textStyleManager(
      color: color,
      fontWeight: FontWeightManager.light,
      size: fontSize,
      height:height
  );
}


TextStyle mediumStyleManager({
  required Color color,
  double fontSize=FontSizeManager.s12,
  double? height,
}){
  return _textStyleManager(
      color: color,
      fontWeight: FontWeightManager.medium,
      size: fontSize,
      height:height,
  );
}