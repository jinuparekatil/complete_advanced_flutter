


import 'package:complete_advanced_flutter/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,

    disabledColor: ColorManager.grey1, // will be used incase of disabled button for example.
    // Color Scheme for Flutter 2.0+
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorManager.primary,
      secondary: ColorManager.grey, // Replacing accentColor
    ),
    // Card view theme

    //Appbar theme

    //Button theme

    //Text theme

    //Input decoration theme(text form field)

  );
}