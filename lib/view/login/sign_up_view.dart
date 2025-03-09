import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/view/login/login_view.dart';
import 'package:rg_foods/view/login/reset_password.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpView();
}

class _SignUpView extends State<SignUpView> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile_no = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();
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
                'Sign Up',
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'Add your Details to Sign up',
                style: TextStyle(
                    color: Tcolor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 64),
              RoundTextfield(
                hintText: "Name",
                controller: _name,
              ),
              SizedBox(height: 25),
              RoundTextfield(
                hintText: "Email",
                controller: _email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Mobile No",
                controller: _mobile_no,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Address",
                controller: _address,
                keyboardType: TextInputType.number,
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
              RoundTextfield(
                hintText: "Confirm Password",
                controller: _confirm_password,
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
                            builder: (context) => ResetPassword()));
                  },
                  title: "Sign up"),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Tcolor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      ' Login',
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
