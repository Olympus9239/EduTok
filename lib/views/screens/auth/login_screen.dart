import 'package:flutter/material.dart';
import 'package:tiktokclone/constant.dart';
import 'package:tiktokclone/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
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
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                  onTap: () {
                    authController.loginUser(_emailController.text, _passwordController.text);

                  },
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don\'t have an account?",
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: (){
                  },
                    child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: buttonColor),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
