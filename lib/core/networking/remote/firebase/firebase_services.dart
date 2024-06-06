//import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: avoid_print

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/core/networking/local/caching_helper.dart';
// import 'package:final_project/core/networking/remote/firebase/firebase_constances.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
// import 'package:final_project/features/chat/data/models/chat_room.dart';
// import 'package:final_project/features/chat/data/models/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
// import 'package:uuid/uuid.dart';

class FirebaseServices{

 FirebaseAuth auth = FirebaseAuth.instance;
 // String userId = CachHelper.getId();
 // final _myUid = CachHelper.getId();
 // final _storage = FirebaseStorage.instance;

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


//  Future<String> createChatroom({
//   required String userId,
//  }) async {
//   try {
//    CollectionReference chatrooms = FirebaseFirestore.instance.collection(
//     FirebaseCollectionNames.chatrooms,
//    );
//
//    // sorted members
//    final sortedMembers = [_myUid, userId]..sort((a, b) => a.compareTo(b));
//
//
//    // existing chatrooms
//    QuerySnapshot existingChatrooms = await chatrooms
//        .where(
//     FirebaseFieldNames.members,
//     isEqualTo: sortedMembers,
//    )
//        .get();
//
//    if (existingChatrooms.docs.isNotEmpty) {
//     return existingChatrooms.docs.first.id;
//    } else {
//     final chatroomId = const Uuid().v1();
//     final now = DateTime.now();
//
//     Chatroom chatroom = Chatroom(
//      chatroomId: chatroomId,
//      lastMessage: '',
//      lastMessageTs: now,
//      members: sortedMembers,
//      createdAt: now,
//     );
//
//     await FirebaseFirestore.instance
//         .collection(FirebaseCollectionNames.chatrooms)
//         .doc(chatroomId)
//         .set(chatroom.toMap());
//
//     return chatroomId;
//    }
//   } catch (e) {
//    return e.toString();
//   }
//  }
//
//  // Send message
//  Future<String?> sendMessage({
//   required String message,
//   required String chatroomId,
//   required String receiverId,
//  }) async {
//   try {
//    final messageId = const Uuid().v1();
//    final now = DateTime.now();
//
//    Message newMessage = Message(
//     message: message,
//     messageId: messageId,
//     senderId: _myUid,
//     receiverId: receiverId,
//     timestamp: now,
//     seen: false,
//     messageType: 'text',
//    );
//
//    DocumentReference myChatroomRef = FirebaseFirestore.instance
//        .collection(FirebaseCollectionNames.chatrooms)
//        .doc(chatroomId);
//
//    await myChatroomRef
//        .collection(FirebaseCollectionNames.messages)
//        .doc(messageId)
//        .set(newMessage.toMap());
//
//    await myChatroomRef.update({
//     FirebaseFieldNames.lastMessage: message,
//     FirebaseFieldNames.lastMessageTs: now.millisecondsSinceEpoch,
//    });
//
//    return null;
//   } catch (e) {
//    return e.toString();
//   }
//  }
//
// // Send message
//  Future<String?> sendFileMessage({
//   required File file,
//   required String chatroomId,
//   required String receiverId,
//   required String messageType,
//  }) async {
//   try {
//    final messageId = const Uuid().v1();
//    final now = DateTime.now();
//
//    // Save to storage
//    Reference ref = _storage.ref(messageType).child(messageId);
//    TaskSnapshot snapshot = await ref.putFile(file);
//    final downloadUrl = await snapshot.ref.getDownloadURL();
//
//    Message newMessage = Message(
//     message: downloadUrl,
//     messageId: messageId,
//     senderId: _myUid,
//     receiverId: receiverId,
//     timestamp: now,
//     seen: false,
//     messageType: messageType,
//    );
//
//    DocumentReference myChatroomRef = FirebaseFirestore.instance
//        .collection(FirebaseCollectionNames.chatrooms)
//        .doc(chatroomId);
//
//    await myChatroomRef
//        .collection(FirebaseCollectionNames.messages)
//        .doc(messageId)
//        .set(newMessage.toMap());
//
//    await myChatroomRef.update({
//     FirebaseFieldNames.lastMessage: 'send a $messageType',
//     FirebaseFieldNames.lastMessageTs: now.millisecondsSinceEpoch,
//    });
//
//    return null;
//   } catch (e) {
//    return e.toString();
//   }
//  }
//
//  Future<String?> seenMessage({
//   required String chatroomId,
//   required String messageId,
//  }) async {
//   try {
//    await FirebaseFirestore.instance
//        .collection(FirebaseCollectionNames.chatrooms)
//        .doc(chatroomId)
//        .collection(FirebaseCollectionNames.messages)
//        .doc(messageId)
//        .update({
//     FirebaseFieldNames.seen: true,
//    });
//
//    return null;
//   } catch (e) {
//    return e.toString();
//   }
//  }

}