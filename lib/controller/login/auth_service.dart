import 'package:Estimatewale/controller/login/login_controller.dart';
import 'package:Estimatewale/controller/user/register_user_controller.dart';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      storeTokenAndData(googleSignInAccount.displayName.toString(), null);
      registerUser(
        context,
        googleSignInAccount.displayName,
        googleSignInAccount.email,
        "",
        "",
        "",
        "",
        "",
        "",
      );
    }
  }
}
