import 'package:firebase_auth/firebase_auth.dart';

class FireBaseHelper{
  final FirebaseAuth auth=FirebaseAuth.instance;
  get user => auth.currentUser;
  Future<String?>registerUser({required String email,required String password})async{
    try {
      await auth.createUserWithEmailAndPassword(
        email:email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    //try{
    //  await auth.createUserWithEmailAndPassword(
    //         email:email,
    //         password: password,
    //       );
    //       return null;}on FireAuthExeception catch(e){
    //       retun e.message;
    //       return e.message}
  }
  //signin user
  Future<String?>loginUser({
    required String email,required String password
  })async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    }on FirebaseAuthException catch(e){
      if(e.code=='user not found'){
        print("no user found that email");
      }else if(e.code=='wrong password'){
        print("wrong password provided for that user");
      }
      return e.message;
    }
  }
  //sign out
  Future<void>logout()async{
    await auth.signOut();
  }
}