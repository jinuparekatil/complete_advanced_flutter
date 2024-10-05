import 'package:complete_advanced_flutter/presentation/forgot_password/forgot_password.dart';
import 'package:complete_advanced_flutter/presentation/login/login.dart';
import 'package:complete_advanced_flutter/presentation/main/main_view.dart';
import 'package:complete_advanced_flutter/presentation/onbarding/onboarding.dart';
import 'package:complete_advanced_flutter/presentation/resorces/string_manager.dart';
import 'package:complete_advanced_flutter/presentation/splash/splash.dart';
import 'package:complete_advanced_flutter/presentation/store_detail/store_details.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return _UndefinedRoute();
    }
  }

  static Route<dynamic> _UndefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
             appBar: AppBar( title: Text(AppStrings.noRouteFound),) ,
             body: Center( child: Text(AppStrings.noRouteFound), ),
        ),);
  }
}