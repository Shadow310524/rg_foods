import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rg_foods/common/color_extension.dart';
import 'package:rg_foods/common_widget/profile_textfield.dart';
import 'package:rg_foods/common_widget/round_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController user_name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mob_no = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm_password = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  //Function to pick Image from Gallery

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset("assets/images/shopping-cart.png",
                        width: 22.76, height: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage();
                      print("working");
                    },
                    child: ClipOval(
                        // borderRadius: BorderRadius.circular(100),
                        child: _imageFile == null
                            ? Image.asset(
                                "assets/images/default_person.png",
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                _imageFile!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              )),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      print("profile edited");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Tcolor.primary,
                          size: 15,
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(color: Tcolor.primary, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hi there Renga!",
                    style: TextStyle(
                        color: Tcolor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      print("Logging Out!!");
                    },
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Tcolor.secondaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ProfileTextfield(
                      hintText: "Enter Name",
                      title: "Name",
                      controller: user_name),
                  SizedBox(height: 20),
                  ProfileTextfield(
                      hintText: "Enter Email",
                      title: "Email",
                      controller: email),
                  SizedBox(height: 20),
                  ProfileTextfield(
                      hintText: "Enter Mobile No",
                      title: "Mobile No",
                      controller: mob_no),
                  SizedBox(height: 20),
                  ProfileTextfield(
                      hintText: "Enter Address",
                      title: "Address",
                      controller: address),
                  SizedBox(height: 20),
                  ProfileTextfield(
                    hintText: "Enter Password",
                    title: "Password",
                    controller: password,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  ProfileTextfield(
                    hintText: "Enter Confirm Password",
                    title: "Confirm Password",
                    controller: confirm_password,
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  RoundButton(onPressed: () {}, title: "Save"),
                  SizedBox(height: 60),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
