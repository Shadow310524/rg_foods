import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/round_button.dart';
import 'package:rg_foods/common_widget/round_textfield.dart';
import 'package:rg_foods/view/login/login_view.dart';
import 'package:rg_foods/view/login/new_password.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPView();
}

class _OTPView extends State<OTPView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
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
                'We have sent an OTP to your Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Please check your mobile number 071*****12\ncontinue to reset your password',
                style: TextStyle(
                  color: Tcolor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 64),
              SizedBox(
                height: 35,
                child: OtpPinField(
                  key: _otpPinFieldController,

                  ///in case you want to enable autoFill
                  autoFillEnable: false,

                  ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                  textInputAction: TextInputAction.done,

                  ///in case you want to change the action of keyboard
                  /// to clear the Otp pin Controller
                  onSubmit: (text) {
                    print('Entered pin is $text');

                    /// return the entered pin
                  },
                  onChange: (text) {
                    print('Enter on change pin is $text');

                    /// return the entered pin
                  },
                  onCodeChanged: (code) {
                    print('onCodeChanged  is $code');
                  },

                  /// to decorate your Otp_Pin_Field
                  otpPinFieldStyle: OtpPinFieldStyle(
                    /// bool to show hints in pin field or not
                    showHintText: true,

                    /// to set the color of hints in pin field or not
                    // hintTextColor: Colors.red,

                    /// To set the text  of hints in pin field
                    // hintText: '1',

                    /// border color for inactive/unfocused Otp_Pin_Field
                    defaultFieldBorderColor: Tcolor.secondaryText,

                    /// border color for active/focused Otp_Pin_Field
                    activeFieldBorderColor: Tcolor.primary,

                    /// Background Color for inactive/unfocused Otp_Pin_Field
                    defaultFieldBackgroundColor: Tcolor.white,

                    /// Background Color for active/focused Otp_Pin_Field
                    activeFieldBackgroundColor: Tcolor.white,

                    /// Background Color for filled field pin box
                    // filledFieldBackgroundColor: Colors.green,

                    /// border Color for filled field pin box
                    // filledFieldBorderColor: Colors.green,
                    //
                    /// gradient border Color for field pin box
                    // activeFieldBorderGradient: LinearGradient(
                    //     colors: [Colors.black, Colors.redAccent]),
                    // filledFieldBorderGradient: LinearGradient(
                    //     colors: [Colors.green, Colors.tealAccent]),
                    // defaultFieldBorderGradient:
                    //     LinearGradient(colors: [Colors.orange, Colors.brown]),
                  ),
                  maxLength: 4,

                  /// no of pin field
                  showCursor: true,

                  /// bool to show cursor in pin field or not
                  cursorColor: Colors.indigo,

                  /// to choose cursor color
                  upperChild: Column(
                    children: [
                      SizedBox(height: 30),
                      Icon(Icons.flutter_dash_outlined, size: 150),
                      SizedBox(height: 20),
                    ],
                  ),

                  ///bool which manage to show custom keyboard
                  showCustomKeyboard: false,

                  /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                  // customKeyboard: Container(),
                  ///bool which manage to show default OS keyboard
                  // showDefaultKeyboard: true,

                  /// to select cursor width
                  cursorWidth: 3,

                  /// place otp pin field according to yourself
                  mainAxisAlignment: MainAxisAlignment.center,

                  /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                  ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                  otpPinFieldDecoration:
                      OtpPinFieldDecoration.defaultPinBoxDecoration,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RoundButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewPassword()));
                  },
                  title: "Next"),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't Recieve OTP? ",
                      style: TextStyle(color: Tcolor.secondaryText),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(color: Tcolor.primary),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
