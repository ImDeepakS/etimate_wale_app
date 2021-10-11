import 'package:Estimatewale/controller/login/login_controller.dart';
import 'package:Estimatewale/controller/user/register_user_controller.dart';
import 'package:Estimatewale/view/app/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final GoogleSignIn googleSignIn = GoogleSignIn();

final FacebookLogin facebookLogin = FacebookLogin();

Future<void> signup(BuildContext context) async {
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

Future<void> signOutFromGoogle() async {
  await googleSignIn.signOut();
  await auth.signOut();
}

Future<void> signInWithFacebook(BuildContext context) async {
  final LoginResult result = await FacebookAuth.instance.login(
    permissions: ["email", "public_profile", "user_friends"],
  );

  if (result.status == LoginStatus.success) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    // get the user data
    // by default we get the userId, email,name and picture
    final userData = await FacebookAuth.instance.getUserData();

    print("result from facebook is ${result.status}");
  } else {
    print("result from facebook is ${result.status}");
    print("result from facebook message ${result.message}");
  }
}
