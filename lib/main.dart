import 'package:approle/app/controllers/auth_controller.dart';
import 'package:approle/app/modules/home/views/home_view.dart';
import 'package:approle/app/modules/login/views/login_view.dart';
import 'package:approle/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        //Bungkus StreBuild untuk cek status login
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snapshot.data != null && snapshot.data!.emailVerified == true
                ? Routes.HOME
                : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshot.data != null ? HomeView():LoginView(),
          );
        }
        return LoadingView();
      },
    );
  }
}
