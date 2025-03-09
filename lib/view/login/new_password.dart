import 'package:flutter/material.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPassword();
}

class _NewPassword extends State<NewPassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
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
                'New Password',
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Please enter your email to receive a\nlink to  create a new password via email',
                style: TextStyle(
                  color: Tcolor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 64),
              RoundTextfield(
                hintText: "New Password",
                controller: _password,
                isPassword: true,
              ),
              SizedBox(
                height: 35,
              ),
              RoundTextfield(
                hintText: "Confirm Password",
                controller: _confirmpassword,
                isPassword: true,
              ),
              SizedBox(
                height: 35,
              ),
              RoundButton(onPressed: () {}, title: "Next"),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
