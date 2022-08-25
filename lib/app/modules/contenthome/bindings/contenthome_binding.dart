import 'package:get/get.dart';

import '../controllers/contenthome_controller.dart';

class ContenthomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContenthomeController>(
      () => ContenthomeController(),
    );
  }
}
