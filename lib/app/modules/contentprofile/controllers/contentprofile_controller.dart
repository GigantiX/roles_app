import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ContentprofileController extends GetxController {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();
  var usersID = FirebaseFirestore.instance.collection('users');
  // Stream<QuerySnapshot<Object?>> streamData() {
  //   CollectionReference profileStream = firestore.collection('users');
  //   return profileStream.snapshots();
  // }
}
