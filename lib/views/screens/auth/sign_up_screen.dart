import 'package:flutter/material.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "EduTok",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    color: Colors.red,
                  ),
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          authController.pickImage();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextInputField(
                    controller: _userNameController,
                    labelText: "User Name",
                    icon: Icons.person,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextInputField(
                    controller: _emailController,
                    labelText: "Email",
                    icon: Icons.email,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextInputField(
                    controller: _passwordController,
                    labelText: "Password",
                    icon: Icons.lock,
                    isObscure: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: InkWell(
                      onTap: () {
                        authController.RegisterUser(
                            _userNameController.text,
                            _emailController.text,
                            _passwordController.text,
                            authController.profilePhoto);
                      },
                      child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 20),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20, color: buttonColor),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  }
}
