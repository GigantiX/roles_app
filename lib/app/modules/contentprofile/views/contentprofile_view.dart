import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../controllers/contentprofile_controller.dart';

class ContentprofileView extends GetView<ContentprofileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.settings_rounded,color: Colors.black,),
            color: Colors.white,
              itemBuilder: (context) =>[
                PopupMenuItem(
                  onTap: () => Future.delayed(
                    const Duration(seconds: 0),
                      () => Dialogs.materialDialog(
                          msg: 'Are you sure want to Logout?',
                          title: "Logout",
                          color: Colors.white,
                          context: context,
                          actions: [
                            IconsOutlineButton(
                              onPressed: () {
                                Get.back();
                                Get.back();
                              },
                              text: 'Cancel',
                              iconData: Icons.cancel_outlined,
                              textStyle: TextStyle(color: Colors.grey),
                              iconColor: Colors.grey,
                            ),
                            IconsButton(
                              onPressed: () => authC.logout(),
                              text: 'Logout',
                              iconData: Icons.logout,
                              color: Colors.red,
                              textStyle: TextStyle(color: Colors.white),
                              iconColor: Colors.white,
                            ),
                          ])
                  ),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.black,),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Logout')
                      ],
                    )
                ),
              ]
          )
        ],
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
          ),
        ),
      ),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 370,
                  height: 120,
                  decoration: BoxDecoration(
                    // border: Border.all()
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 44,
                        backgroundImage: AssetImage('assets/images/Profile.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          // border: Border.all()
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Axel Ganendra',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                            ),
                            Text('+6282138894119',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit)
                      ),
                      // ElevatedButton(
                      //     onPressed: () => authC.logout(),
                      //     child: Text('Logout')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
