import 'package:get/get.dart';
import 'package:iatt/app/module/frame/controllers/frame_controller.dart';

class FrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrameController>(
      () => FrameController(),
    );
  }
}
