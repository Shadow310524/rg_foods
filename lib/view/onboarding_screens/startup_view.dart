import 'package:flutter/material.dart';
import 'package:rg_foods/view/login/welcome_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/splash_screen.png",
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/images/app_logo.png",
            // height: size.height * 0.11,
            width: size.width * 0.55,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
