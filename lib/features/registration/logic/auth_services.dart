// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static String verifyID = '';


  static Future<void> phoneAuthRecaptcha() async{
    firebaseAuth.setSettings(
      appVerificationDisabledForTesting: true,
      forceRecaptchaFlow: true,
    );
  }

  static Future sendOTP({
    required String phoneNumber,
    required Function errorStep,
    required Function nextStep,
  }) async {
    await phoneAuthRecaptcha();
    firebaseAuth
        .verifyPhoneNumber(
      //forceResendingToken: ,
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 90),
      verificationCompleted: (phoneAuthCredential) async {
        return;
      },
      verificationFailed: (error) async {
        return;
      },
      codeSent: (verificationId, forceResendingToken) async {
        verifyID = verificationId;
        print('verfiy id id $verifyID');
        nextStep();
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        return;
      },
    )
        .onError((error, stackTrace) {
          print('error is in error step');
      errorStep();
    });
  }

  static Future loginWithOTP({required String otp}) async {
    print('verfiy id id $verifyID');
    final cred = PhoneAuthProvider.credential(
      verificationId: verifyID,
      smsCode: otp,
    );

    try {
      final user = await firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        return 'Success';
      } else {
        'error in otp login';
      }
    } on FirebaseAuthException catch (e) {
      return ' the error is in firebase auth exception ${e.message.toString()}';
    } catch (e) {
      return ' the error is in e exception ${e.toString()}';
    }
  }

  static Future logOut() async {
    await firebaseAuth.signOut();
  }

  static Future<bool> loggedIn() async {
    var user = firebaseAuth.currentUser;
    return user != null;
  }

}
