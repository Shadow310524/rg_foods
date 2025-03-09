import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/view/login/login_view.dart';
import 'package:rg_foods/view/login/otp_view.dart';

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
                width: size.width * 0.5,
                height: size.width * 0.4,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          Text(
            'Discover the best foods from over 1,000\nrestaurants and fast delivery to your \ndoorstep',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Tcolor.secondaryText),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: RoundButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  title: 'Login')),
          SizedBox(
            height: size.width * 0.1,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: RoundButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPView()));
                },
                title: 'Create an Account',
                type: RoundButtonType.textPrimary,
              )),
        ],
      ),
    );
  }
}
