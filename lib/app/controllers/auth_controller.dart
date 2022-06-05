import 'package:approle/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(String email, String pass) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      await myUser.user?.sendEmailVerification();
      Get.defaultDialog(
        title: 'Email Verification',
        middleText:
            'Silahkan verifikasi melalui email $email yang telah kami kirim',
        textConfirm: 'OK',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Password Lemah',
          middleText:
              'Password yang anda pilih sangat rentan, gunakan kombinasi angka untuk keamanan lebih',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: 'Email Telah Digunakan',
          middleText:
          'The account already exists for that email.',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String pass) async {
    try {
      UserCredential myUser =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Email Verification',
          middleText:
              'Silahkan verifikasi melalui email $email yang telah kami kirim',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: 'Email Tidak Ditemukan',
          middleText:
          'Silahkan cek kembali email anda',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: 'Wrong Password',
          middleText:
          'Password yang anda masukkan salah',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
