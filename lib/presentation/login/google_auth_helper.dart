import 'package:account_book/application/my_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  const GoogleAuthHelper();

  Future<void> loginAsGoogle(
      {required BuildContext context,
      required Function onSuccess,
      required Function onFailure}) async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final resultCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (resultCredential.user != null) {
        MyService.to.uid = resultCredential.user!.uid;
        onSuccess();
      } else {
        onFailure();
      }
    } catch (e) {
      onFailure();
    }
  }
}
