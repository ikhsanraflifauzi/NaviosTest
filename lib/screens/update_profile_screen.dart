import 'package:flutter/material.dart';
import 'package:navios_test/controllers/update_profile.dart';
import 'package:navios_test/models/userdata_model.dart';
import 'package:navios_test/screens/profile_screen.dart';
import 'package:navios_test/utils/color_constant.dart';
import 'package:navios_test/widgets/input_textfield.dart';

class UpdateProfileScreen extends StatefulWidget {
  final Userdata? userdata;

  const UpdateProfileScreen({Key? key, required this.userdata})
      : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.userdata != null) {
      nameController.text = widget.userdata!.name;
      emailController.text = widget.userdata!.email;
      noHpController.text = widget.userdata!.noHp;
    }
  }

  @override
  Widget build(BuildContext context) {
    void updateProfile() async {
      String response = await UpdateProfiles().updateProfile(
        name: nameController.text,
        email: emailController.text,
        noHp: noHpController.text,
      );
      if (response == "Success") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.blue1,
      ),
      backgroundColor: ColorConstants.backgroundLight,
      body: ListView(
        children: [
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
                  hintText: 'Email',
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
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.yellow1,
                    ),
                    onPressed: updateProfile,
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
