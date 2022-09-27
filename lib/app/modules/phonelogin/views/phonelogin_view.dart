import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:approle/app/controllers/auth_controller.dart';
import 'package:approle/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/phonelogin_controller.dart';

final authC = Get.find<AuthController>();
FirebaseAuth auth = FirebaseAuth.instance;
TextEditingController phoNum = TextEditingController();
TextEditingController otpNum = TextEditingController();
bool otpFill = false;
String verifyID = "";

class PhoneloginView extends GetView<PhoneloginController> {


  @override
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
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/images/DiviAcademy.png',
                  height: 180,
                  width: 180,
                ),
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          // enabled: otpFill == false? true:false,
                          controller: phoNum,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: "Your Number",
                              prefixIcon: Icon(Icons.phone),
                              prefixText: "+62-",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.OTPSCREEN);
                            verifyNumber();
                          },
                          child: Text("Verify"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(5),
                              minimumSize: Size(330, 45)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('OR'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.LOGIN),
                              child: Icon(Icons.mail, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  primary: Colors.blue,
                                  // ^ Button color
                                  onPrimary: Colors.red,
                                  // ^ Splash color
                                  fixedSize: const Size(50, 50)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.grey[300],
    );
  }

  void verifyNumber() async {

    auth.verifyPhoneNumber(
      phoneNumber: '+62${phoNum.text}',
      verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential).then((value) async {
          print('Login Phone Succesfully');
          if (value.user != null){
            Get.offAllNamed(Routes.HOME);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken){
        verifyID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verifyID = verificationId;
      },
      timeout: Duration(seconds: 120)
    );
  }

}



