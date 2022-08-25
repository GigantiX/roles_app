import 'package:approle/app/controllers/auth_controller.dart';
import 'package:approle/app/modules/contentcourse/views/contentcourse_view.dart';
import 'package:approle/app/modules/contentevent/views/contentevent_view.dart';
import 'package:approle/app/modules/contenthome/views/contenthome_view.dart';
import 'package:approle/app/modules/contentprofile/views/contentprofile_view.dart';
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
    return GetBuilder<HomeController>(builder: (controller){
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('HomeView'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(onPressed: () => authC.logout(), icon: Icon(Icons.logout))
        //   ],
        // ),
        body:  SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              ContenthomeView(),
              ContenteventView(),
              ContentcourseView(),
              ContentprofileView()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10
            ),
            child:
            GNav(
                tabBackgroundColor: Colors.cyan.withOpacity(0.7),
                color: Colors.black45,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.all(16),
                selectedIndex: controller.tabIndex,
                onTabChange: controller.changeTab,
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
    });
  }
}
