
import 'package:approle/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SetprofileController extends GetxController {
  late TextEditingController nameC;
  String? uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> setName(String name) async {
    DocumentReference<Map<String, dynamic>> users = firestore.collection('users').doc(uid.toString());
    try{
      await users.set({
        "name": name
      });

      Get.defaultDialog(
        title: 'Done',
        middleText: 'Profile has been changed',
        onConfirm: () => Get.offAllNamed(Routes.HOME),
        textConfirm: 'Ok',
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Profile failed to change"
      );
    }
  }
  @override
  void onInit() {
    nameC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    super.onClose();
  }
}
