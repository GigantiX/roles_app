import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/contentprofile_controller.dart';

class ContentprofileView extends GetView<ContentprofileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 44,
                      backgroundImage: AssetImage('assets/images/Profile.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Axel Ganendra',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                        onPressed: () => authC.logout(),
                        child: Icon(Icons.logout)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
