import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

 Future<void> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      await _auth.signInWithCredential(credential);
    } else {
      // User cancelled the login process
      // Handle accordingly
    }
  } catch (e) {
    if (e is Exception) {
      print('Facebook authentication error: $e');
      // Handle specific Facebook authentication exceptions using error codes
      if (e.toString().contains('access_denied')) {
        // User denied the permission
      } else if (e.toString().contains('email_already_in_use')) {
        // Email is already associated with another account
      } else if (e.toString().contains('invalid_credentials')) {
        // Invalid Facebook credentials
      }
    }
    // Handle any other exceptions that occur during the login process
    print('Error during Facebook login: $e');
  }
}




//   Future<void> signInWithFacebook() async {
//   try {
//     // Trigger the Facebook authentication flow
//     final LoginResult result = await FacebookAuth.instance.login();

//     // Obtain the access token from the result
//     final AccessToken accessToken = result.accessToken!;

//     // Create a Facebook credential using the access token
//     final OAuthCredential facebookCredential =
//         FacebookAuthProvider.credential(accessToken.token);

//     // Sign in with the Facebook credential
//     final UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithCredential(facebookCredential);

//     // Access the signed-in user
//     final User? user = userCredential.user;

//     // Perform any additional operations with the signed-in user
//     // ...
//   } catch (e) {
//     // Handle the exception here
//     print('An error occurred during Facebook sign-in: $e');
//   }
// }


  Future<void> signOut() async {
    await _auth.signOut();
  }
}
