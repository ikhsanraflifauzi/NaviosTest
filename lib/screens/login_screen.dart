import 'package:flutter/material.dart';
import 'package:navios_test/controllers/login_controller.dart';
import 'package:navios_test/screens/profile_screen.dart';
import 'package:navios_test/screens/sign_up_screen.dart';
import 'package:navios_test/utils/color_constant.dart';

import 'package:navios_test/widgets/input_textfield.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void navigatorsignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void loginUser() async {
      String response = await LoginController().loginUser(
        email: emailController.text,
        password: passController.text,
      );
      if (response == "Success") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: ColorConstants.blue2,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              InputTextFiled(
                textEditingController: emailController,
                hintText: 'email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              InputTextFiled(
                textEditingController: passController,
                hintText: 'password',
                textInputType: TextInputType.visiblePassword,
                IsPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.green1),
                    onPressed: loginUser,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Flexible(flex: 4, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      " Dont have Account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: navigatorsignup,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        " Sign up ?",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
