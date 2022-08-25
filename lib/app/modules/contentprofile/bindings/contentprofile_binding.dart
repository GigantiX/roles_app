import 'package:get/get.dart';

import '../controllers/contentprofile_controller.dart';

class ContentprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentprofileController>(
      () => ContentprofileController(),
    );
  }
}
