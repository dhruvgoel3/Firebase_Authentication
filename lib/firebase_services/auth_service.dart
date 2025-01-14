import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglesignwithDevices{
  final auth = FirebaseAuth.instance;
  final googleSignInDevices = GoogleSignIn();

  Future<User?>signUpwithGmail()async{
    try{
      final GoogleSignInAccount? googleUser = await googleSignInDevices.signIn();
      if(googleUser == null){
        return null;}
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      final userCredential = await auth.signInWithCredential(credential);
      return userCredential.user;

    }catch(e){
      print(e.toString());
      return null;
    }
  }
}