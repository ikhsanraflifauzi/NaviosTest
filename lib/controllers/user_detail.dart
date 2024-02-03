import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navios_test/models/userdata_model.dart';

class Userdetails {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Userdata> getUserDetails() async {
    User currentUser = auth.currentUser!;
    DocumentSnapshot snap =
        await firestore.collection('users').doc(currentUser.uid).get();
    return Userdata.fromSnap(snap);
  }
}
