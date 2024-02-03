import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navios_test/models/userdata_model.dart';

class SignupController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> registerUser({
    required String name,
    required String password,
    required String email,
    required String noHp,
  }) async {
    String response = "Some error required";
    try {
      if (name.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty ||
          noHp.isNotEmpty) {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Userdata userdata = Userdata(
          name: name,
          uid: credential.user!.uid,
          email: email,
          noHp: noHp,
        );
        await firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(userdata.toJson());
      }
      response = "Success";
    } catch (e) {
      response = e.toString();
    }
    return response;
  }
}
