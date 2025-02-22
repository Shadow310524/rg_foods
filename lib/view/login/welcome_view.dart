import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                "assets/images/welcome_top.png",
                width: size.width,
              ),
              Image.asset(
                "assets/images/app_logo.png",
                width: size.width * 0.4,
                // fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
