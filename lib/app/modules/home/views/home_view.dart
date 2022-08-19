import 'package:approle/app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  String? uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          'HomeView is working with ${uid}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),
          child: GNav(
              tabBackgroundColor: Colors.cyan.withOpacity(0.7),
              color: Colors.black45,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.all(16),
              selectedIndex: 0,
              onTabChange: (index){
                print(index);
              },
              gap: 8,
              // curve: Curves.easeInExpo,
              // duration: Duration(microseconds: 800),
              tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.event_note,
              text: 'Event',
            ),
            GButton(
              icon: Icons.video_collection,
              text: 'Course',
            ),
            GButton(
              icon: Icons.people_alt_sharp,
              text: 'Profile',
            ),
          ]),
        ),
      ),
    );
  }
}
