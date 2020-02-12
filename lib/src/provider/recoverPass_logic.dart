import 'package:firebase_auth/firebase_auth.dart';

abstract class  RecoverPassLogic{
  Future recoverPass(String email);
}
class RecoverPassException implements Exception{}

class SimpleRecover extends RecoverPassLogic{
  @override
  Future recoverPass(String email) async {
    await Future.delayed(Duration(seconds: 2));
    if( email != "test@test.com"){
      throw RecoverPassException();
    }
    print("Recuperando pass");
    return true;
  }
}

class recoverPassWhitFirebase extends RecoverPassLogic{
  final auth = FirebaseAuth.instance;
  @override
  Future  recoverPass(String email) async {
   await auth.sendPasswordResetEmail(email: email);
   return true;


  }

}