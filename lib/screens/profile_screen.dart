import 'package:flutter/material.dart';
import 'package:navios_test/provider/user_provider.dart';
import 'package:navios_test/screens/update_profile_screen.dart';
import 'package:navios_test/utils/color_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navios_test/screens/login_screen.dart';
import 'package:navios_test/widgets/data_text.dart';
import 'package:provider/provider.dart';
import 'package:navios_test/models/userdata_model.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    updateData();
    super.initState();
  }

  updateData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  Userdata? userdata;

  @override
  Widget build(BuildContext context) {
    userdata = Provider.of<UserProvider>(context).getUser;

    void navigateToUpdateProfile() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UpdateProfileScreen(
            userdata: userdata,
          ),
        ),
      );
    }

    if (userdata != null) {
      return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: ColorConstants.blue1,
          ),
          body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                decoration: BoxDecoration(
                  color: ColorConstants.veryClearBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DataText(name: "Nama", value: userdata!.name),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DataText(name: "Email", value: userdata!.email),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DataText(name: "No.Hp", value: userdata!.noHp),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: navigateToUpdateProfile,
                leading: const Icon(Icons.key, color: Colors.blue),
                title: const Text('Update Profile',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 12,
                      color: Colors.black,
                    )),
              ),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Log out',
                    style: TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 12,
                      color: Colors.red,
                    )),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: ColorConstants.blue1,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
