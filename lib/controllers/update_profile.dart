import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navios_test/models/userdata_model.dart';

class UpdateProfiles {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> updateProfile({
    required String name,
    required String email,
    required String noHp,
  }) async {
    try {
      if (name.isEmpty || email.isEmpty || noHp.isEmpty) {
        return "All fields are required";
      }

      User? user = _auth.currentUser;

      if (user == null) {
        return "User not authenticated";
      }

      String uid = user.uid;
      Userdata userdata =
          Userdata(name: name, uid: uid, email: email, noHp: noHp);

      await _firestore.collection('users').doc(uid).update(userdata.toJson());

      return "Success";
    } catch (e) {
      return "Error: $e";
    }
  }
}
