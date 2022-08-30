import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/contentprofile_controller.dart';

class ContentprofileView extends GetView<ContentprofileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text(
                    'Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                ),
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
                        width: 10,
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
                      AnimatedButton(
                        text: 'Logout',
                        onPress: () => authC.logout(),
                        width: 85,
                        height: 40,
                        transitionType: TransitionType.CENTER_TB_OUT,
                        selectedBackgroundColor: Colors.black45,
                        selectedTextColor: Colors.white,
                        backgroundColor: Colors.indigoAccent,
                        isReverse: true,
                        borderRadius: 20,
                        textStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white
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
