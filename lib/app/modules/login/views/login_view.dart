import 'package:approle/app/controllers/auth_controller.dart';
import 'package:approle/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  var pass = true.obs;

  // bool pass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgwhite.jpg'),
              fit: BoxFit.cover
          ),
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
                  height: 360,
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
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: controller.emailC,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextField(
                            controller: controller.passC,
                            textInputAction: TextInputAction.done,
                            obscureText: pass.value,
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.key),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      if (pass.value == true) {
                                        pass.value = false;
                                      } else {
                                        pass.value = true;
                                      }
                                    },
                                    icon: Icon(Icons.remove_red_eye)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => authC.login(
                              controller.emailC.text, controller.passC.text),
                          child: Text("Login"),
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
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.PHONELOGIN),
                              child: Icon(Icons.phone, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  primary: Colors.blue,
                                  onPrimary: Colors.red,
                                  fixedSize: const Size(50, 50)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun?'),
                    TextButton(
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                        child: Text('DAFTAR SEKARANG')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: Colors.grey[300],
    );
  }
}
