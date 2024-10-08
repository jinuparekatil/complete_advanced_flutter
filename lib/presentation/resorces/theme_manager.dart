import 'package:complete_advanced_flutter/presentation/resorces/color_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/font_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces//styles_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager
        .grey1, // will be used incase of disabled button for example.
    //ripple Color
    splashColor: ColorManager.primaryOpacity70,
    // Color Scheme for Flutter 2.0+
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorManager.primary,
      secondary: ColorManager.grey, // Replacing accentColor
    ),
    // Card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    //Appbar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12)),
    //Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70),
    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12))),
    ),
    //Text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        titleMedium: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        titleSmall: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.grey1),
        bodyLarge: getRegularStyle(color: ColorManager.grey)),
    //Input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      //label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      //focusedBorder
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
     //error border
      errorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      //focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    ),

  );
}
