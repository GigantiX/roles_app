import 'package:get/get.dart';

import '../controllers/contentevent_controller.dart';

class ContenteventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContenteventController>(
      () => ContenteventController(),
    );
  }
}
