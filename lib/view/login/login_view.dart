import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/logo.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/view/login/sign_up_view.dart';
import 'package:rg_foods/view/onboarding_screens/onboarding_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 64),
              Text(
                'Login',
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'Add your Details to Login',
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 64),
              RoundTextfield(
                hintText: "Your Email",
                controller: _email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Password",
                controller: _password,
                isPassword: true,
              ),
              SizedBox(
                height: 25,
              ),
              RoundButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingView()));
                  },
                  title: "Login"),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 15,
                    color: Tcolor.secondaryText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Or Login with",
                style: TextStyle(
                  fontSize: 15,
                  color: Tcolor.secondaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Logo(
                  icon: 'assets/images/facebook-letter-logo.png',
                  title: "Log in with Facebook",
                  onpressed: () {},
                  color: Color(0xff367FC0)),
              SizedBox(
                height: 25,
              ),
              Logo(
                  icon: 'assets/images/google-plus-logo.png',
                  title: "Log in with Google",
                  onpressed: () {},
                  color: Color(0xffDD4839)),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Tcolor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      ' Sign Up',
                      style: TextStyle(
                          color: Tcolor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
