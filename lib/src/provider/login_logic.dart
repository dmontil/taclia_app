import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:taclia_app/src/models/user.dart';
import 'package:taclia_app/src/services/local_storage_service.dart';
import 'package:taclia_app/src/services/user_service.dart';

abstract class LoginLogic {
  Future<dynamic> login(String email, String password);
  Future<dynamic> logout();
}

class LoginException implements Exception {}

class SimpleLogin extends LoginLogic {
  @override
  Future login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email != "1" || password != "1") {
      throw LoginException();
    }
    User user =
        User(userName: email, password: password, token: "Tokem random");
    GetIt.I.get<LocalStorageService>().setUser(user);
    UserService().setCurrentUser(user);
    return true;
  }

  @override
  Future<String> logout() async {

    return "Saliste";
  }
}

class LoginWhitFirebase extends LoginLogic {
  final auth = FirebaseAuth.instance;
  @override
  Future login(String email, String password) async {
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        // save token if is necesary
        return true;
      }
    } catch (e) {
      //Exception drive
      print(e.toString());
      throw LoginException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
