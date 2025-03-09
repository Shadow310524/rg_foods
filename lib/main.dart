import 'package:flutter/material.dart';
import 'package:rg_foods/view/home/home_view.dart';
import 'package:rg_foods/view/login/welcome_view.dart';
import 'package:rg_foods/view/main_tab/maintab_view.dart';
import 'package:rg_foods/view/onboarding_screens/onboarding_view.dart';
import 'package:rg_foods/view/onboarding_screens/startup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          fontFamily: "Metropolis",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: StartupView());
  }
}
