import 'package:firebase_auth/firebase_auth.dart';

abstract class  RegisterLogic{
  Future<bool> register(String email, String password);
}
class RegisterException implements Exception{}

class SimpleRegister extends RegisterLogic{
  @override
  Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if( password.length < 5){
      throw RegisterException();
    }
    print("Registrado");
    return true;
  }
}

class RegisterWhitFirebase extends RegisterLogic{
  final auth = FirebaseAuth.instance;
  @override
  Future<bool> register(String email, String password) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        // GUARDAR TOKEN
        return true;
      }
    }catch (e){
      // MANEJAR EXEPCION
      print(e.toString());
      throw RegisterException();

    }
  }

}
