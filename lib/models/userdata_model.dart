import 'package:cloud_firestore/cloud_firestore.dart';

class Userdata {
  final String name;
  final String uid;
  final String email;
  final String noHp;

  const Userdata({
    required this.name,
    required this.uid,
    required this.email,
    required this.noHp,
  });

  Map<String, dynamic> toJson() => {
        "Nama": name,
        "Uid": uid,
        "Email": email,
        "No.Hp": noHp,
      };
  factory Userdata.fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return Userdata(
        name: snap['Nama'],
        uid: snap['Uid'],
        email: snap['Email'],
        noHp: snap['No.Hp']);
  }
}
