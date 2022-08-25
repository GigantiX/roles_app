import 'package:get/get.dart';

import '../controllers/contentcourse_controller.dart';

class ContentcourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentcourseController>(
      () => ContentcourseController(),
    );
  }
}
