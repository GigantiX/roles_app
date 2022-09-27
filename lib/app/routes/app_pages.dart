import 'package:get/get.dart';

import 'package:approle/app/modules/contentcourse/bindings/contentcourse_binding.dart';
import 'package:approle/app/modules/contentcourse/views/contentcourse_view.dart';
import 'package:approle/app/modules/contentevent/bindings/contentevent_binding.dart';
import 'package:approle/app/modules/contentevent/views/contentevent_view.dart';
import 'package:approle/app/modules/contenthome/bindings/contenthome_binding.dart';
import 'package:approle/app/modules/contenthome/views/contenthome_view.dart';
import 'package:approle/app/modules/contentprofile/bindings/contentprofile_binding.dart';
import 'package:approle/app/modules/contentprofile/views/contentprofile_view.dart';
import 'package:approle/app/modules/home/bindings/home_binding.dart';
import 'package:approle/app/modules/home/views/home_view.dart';
import 'package:approle/app/modules/login/bindings/login_binding.dart';
import 'package:approle/app/modules/login/views/login_view.dart';
import 'package:approle/app/modules/otpscreen/bindings/otpscreen_binding.dart';
import 'package:approle/app/modules/otpscreen/views/otpscreen_view.dart';
import 'package:approle/app/modules/phonelogin/bindings/phonelogin_binding.dart';
import 'package:approle/app/modules/phonelogin/views/phonelogin_view.dart';
import 'package:approle/app/modules/setprofile/bindings/setprofile_binding.dart';
import 'package:approle/app/modules/setprofile/views/setprofile_view.dart';
import 'package:approle/app/modules/signup/bindings/signup_binding.dart';
import 'package:approle/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PHONELOGIN,
      page: () => PhoneloginView(),
      binding: PhoneloginBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => OtpscreenView(),
      binding: OtpscreenBinding(),
    ),
    GetPage(
      name: _Paths.CONTENTHOME,
      page: () => ContenthomeView(),
      binding: ContenthomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTENTEVENT,
      page: () => ContenteventView(),
      binding: ContenteventBinding(),
    ),
    GetPage(
      name: _Paths.CONTENTCOURSE,
      page: () => ContentcourseView(),
      binding: ContentcourseBinding(),
    ),
    GetPage(
      name: _Paths.CONTENTPROFILE,
      page: () => ContentprofileView(),
      binding: ContentprofileBinding(),
    ),
    GetPage(
      name: _Paths.SETPROFILE,
      page: () => SetprofileView(),
      binding: SetprofileBinding(),
    ),
  ];
}
