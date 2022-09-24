import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  onTap: () => authC.logout(),
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
                        width: 20,
                      ),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              // padding: EdgeInsets.all(20),
                              primary: Colors.white,
                              shadowColor: Colors.white
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 17,
                            ),
                        ),
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
