import 'package:approle/app/controllers/auth_controller.dart';
import 'package:approle/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo1.png',
                height: 280,
                width: 280,
              ),
              Container(
                height: 340,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: controller.emailC,
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: controller.passC,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () => authC.signup(
                            controller.emailC.text, controller.passC.text),
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.white),
                            ),
                            padding: EdgeInsets.all(5),
                            minimumSize: Size(330, 45)
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('OR'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,),
                          IconButton(
                            onPressed: () => Get.toNamed(Routes.SIGNUP),
                            icon: Icon(Icons.phone),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.mail, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                                primary: Colors.blue, // <-- Button color
                                onPrimary: Colors.red, // <-- Splash color
                                minimumSize: Size(10, 10)
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah mempunyai akun?'),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: Text('LOGIN SEKARANG')),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
