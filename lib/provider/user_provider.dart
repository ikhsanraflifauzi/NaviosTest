import 'package:flutter/widgets.dart';
import 'package:navios_test/models/userdata_model.dart';
import 'package:navios_test/controllers/user_detail.dart';

class UserProvider with ChangeNotifier {
  Userdata? _user;

  final Userdetails _userdetails = Userdetails();

  Userdata? get getUser => _user;
  Future<void> refreshUser() async {
    Userdata user = await _userdetails.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
