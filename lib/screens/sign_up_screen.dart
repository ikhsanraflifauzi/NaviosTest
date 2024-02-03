import 'package:flutter/material.dart';
import 'package:navios_test/controllers/signup_controller.dart';
import 'package:navios_test/screens/login_screen.dart';
import 'package:navios_test/utils/color_constant.dart';
import 'package:navios_test/widgets/input_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void navigatorlogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Loginscreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void registerUser() async {
      String response = await SignupController().registerUser(
          name: nameController.text,
          password: passController.text,
          email: emailController.text,
          noHp: noHpController.text);
      if (response == "Success") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Loginscreen(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: ColorConstants.green1,
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              InputTextFiled(
                textEditingController: nameController,
                hintText: 'Nama',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 24,
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
                textEditingController: noHpController,
                hintText: 'No.Hp',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 24,
              ),
              InputTextFiled(
                textEditingController: passController,
                hintText: 'password',
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.yellow1),
                    onPressed: registerUser,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              // Flexible(flex: 4, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      " Already have Account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: navigatorlogin,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        " Login ?",
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
      ]),
    );
  }
}
