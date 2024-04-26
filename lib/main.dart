import 'package:clean_folder_str/app/app.dart';
import 'package:clean_folder_str/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = DemoAppBlocObserver();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MyDemoApp(
      sharedPreferences: sharedPreferences,
    ),
  );
}
