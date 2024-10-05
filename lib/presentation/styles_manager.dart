import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

//regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.regular, color);
}


//Light Text Style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.light, color);
}


//Bold Text Style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.bold, color);
}


//Semi Bold Text Style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.semibold, color);
}

//Medium Text Style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.medium, color);
}
