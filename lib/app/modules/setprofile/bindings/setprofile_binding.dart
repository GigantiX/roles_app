import 'package:get/get.dart';

import '../controllers/setprofile_controller.dart';

class SetprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetprofileController>(
      () => SetprofileController(),
    );
  }
}
