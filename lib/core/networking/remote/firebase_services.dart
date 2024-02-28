//import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: avoid_print

import 'package:final_project/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseServices{

 FirebaseAuth auth = FirebaseAuth.instance;

 // void phoneAuth({required String phoneNumber,required String smsCode,required BuildContext context ,}) async {
 //   await FirebaseAuth.instance.verifyPhoneNumber(
 //     phoneNumber: '+2$phoneNumber',
 //     timeout: const Duration(seconds: 90),
 //     verificationCompleted: (PhoneAuthCredential credential) {},
 //     verificationFailed: (FirebaseAuthException e) {
 //       if (e.code == 'invalid-phone-number') {
 //         print('The provided phone number is not valid.');
 //       }else{
 //         print(e.toString());
 //       }
 //     },
 //     codeSent: (String verificationId, int? resendToken) async {
 //       try{
 //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
 //           verificationId: verificationId,
 //           smsCode: smsCode,
 //         );
 //         await auth.signInWithCredential(credential).then((value) {
 //           print(value.user);
 //           print(value.additionalUserInfo!.username);
 //           if(value.user != null){
 //             Navigator.pushNamedAndRemoveUntil(context, RoutesManager.landScreen, (route) => false);
 //           }
 //         });
 //       }
 //       catch(ex){
 //         print('error is $ex');
 //       }
 //     },
 //     codeAutoRetrievalTimeout: (String verificationId) {},
 //   );
 // }

 void phoneAuth({required String phoneNumber, required BuildContext context ,}) async {
  try{
   await auth.verifyPhoneNumber(
    phoneNumber: '+2$phoneNumber',
    timeout: const Duration(seconds: 90),
    verificationCompleted: (PhoneAuthCredential credential) async {
     await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
     if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
     }else{
      print(e.toString());
     }
    },
    codeSent: (String verificationId, int? resendToken) async {
     Navigator.pushNamed(context, RoutesManager.phoneAuthScreen);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
   );
  }
  catch(ex){
   print('error isssssss $ex');
  }
 }


}