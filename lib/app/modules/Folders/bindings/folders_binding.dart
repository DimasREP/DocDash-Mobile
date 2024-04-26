import 'package:get/get.dart';

import '../controllers/folders_controller.dart';

class FoldersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoldersController>(
      () => FoldersController(),
    );
  }
}
