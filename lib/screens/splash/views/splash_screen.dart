import 'package:clean_folder_str/screens/authentication/bloc/authentication_bloc.dart';
import 'package:clean_folder_str/screens/dashboard/views/dashboard_screen.dart';
import 'package:clean_folder_str/screens/login/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash-screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen.routeName,
                (route) => false,
              );
            });
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                DashboardScreen.routeName,
                (route) => false,
              );
            });
          }
        },
        child: const Center(
          child: Text("Demo App"),
        ),
      ),
    );
  }
}
