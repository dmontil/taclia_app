import 'package:firebase_auth/firebase_auth.dart';
import 'package:taclia_app/src/models/user.dart';

class UserService{
 User _user = User();
 final _auth = FirebaseAuth.instance;

 UserService() {}

 User getCurrentUser() {
   return _user;
 }

 setCurrentUser(User user) {
   _user = user;
 }



 Future<FirebaseUser> getCurrentUserFirebase() async {
   try {
     return await _auth.currentUser();
   } catch (e) {
     print(e);
   }
 }


}