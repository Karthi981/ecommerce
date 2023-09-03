import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseApi {
  final _message=FirebaseMessaging.instance;
  final DocumentReference documentReference = FirebaseFirestore.instance.collection('token').doc('token2');

  Future<void> initialnotifications()async{
    await _message.requestPermission();
    final _devicetoken = await  _message.getToken();

    documentReference.update({
      'fcmtoken': _devicetoken.toString(),
    });
    //print token
    // print("Token: $_devicetoken");
  }

  // Future<void> createtoken(String token)async{
  //   final docUser = FirebaseFirestore.instance
  //       .collection('token').doc('token2');
  //   final json = {
  //     'fcmtoken' : token
  //   };
  //   await docUser.set(json);
  // }

}