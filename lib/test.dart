import 'package:complete_advanced_flutter/app/app.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});
  void updateAppState() {
    // MyApp.instance.appState = 10;
    MyApp app = MyApp();
    app.appState = 10;
  }

  // void getAppState() {
  //   print(MyApp.instance.appState);
  // }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
