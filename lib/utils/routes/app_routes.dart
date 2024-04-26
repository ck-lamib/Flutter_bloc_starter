import 'package:clean_folder_str/screens/dashboard/views/dashboard_screen.dart';
import 'package:clean_folder_str/screens/home/views/home_screen.dart';
import 'package:clean_folder_str/screens/login/views/login_screen.dart';
import 'package:clean_folder_str/screens/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );
    //login screen route
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //dashboard-routes
    case DashboardScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    //homescreen
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              "",
              // AppLocalizations.of(_)!.appPageRouteNotFound(settings.name ?? ""),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
  }
}
