
import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:approle/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'package:get/get.dart';

import '../controllers/otpscreen_controller.dart';

final pinController = TextEditingController();

class OtpscreenView extends GetView<OtpscreenController> {

  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  static const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  static const fillColor = Color.fromRGBO(243, 246, 249, 0);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: borderColor),
    ),
  );

  @override
  double heiBox = 45;
  double widBox = 45;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgwhite.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/iconRoles.png',
                  height: 260,
                  width: 260,
                ),
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Verify Phone',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          '+62 - ${phoNum.text}',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          controller: pinController,
                          focusNode: focusNode,
                          pinAnimationType: PinAnimationType.fade,
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: focusedBorderColor,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: focusedBorderColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        ElevatedButton(
                            onPressed: (){
                              verifyOtp();
                            },
                            child: Text('Verify'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(5),
                              minimumSize: Size(330, 45)),

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

verifyOtp() async {

  try{
    await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verifyID,
            smsCode: pinController.text
        )).then((value) async {
       if (value.user != null){
         Get.offAllNamed(Routes.HOME);
       }
    });
  } catch (e){
    print(e);
  }

  // PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //   verificationId: verifyID,
  //   smsCode: pinController.text,
  // );
  // await auth.signInWithCredential(credential).then((value) {
  //   print('Login Succesful');
  // });
}


