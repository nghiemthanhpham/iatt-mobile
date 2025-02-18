import 'package:get/get.dart';
import 'package:iatt/app/module/begin/controllers/begin_controller.dart';

class BeginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeginController>(
      () => BeginController(),
    );
  }
}
