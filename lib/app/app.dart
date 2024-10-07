import 'package:complete_advanced_flutter/presentation/resorces/roots_manager.dart';
import 'package:complete_advanced_flutter/presentation/resorces/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //private named constructor
  int appState = 0;
  static final MyApp _instance =
      MyApp._internal(); //  single instance -- singleton

  factory MyApp() => _instance; //Factory for the class instance
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
