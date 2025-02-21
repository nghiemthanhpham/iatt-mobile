import 'package:get/get.dart';
import 'package:iatt/app/routes/app_pages.dart';

class BeginController extends GetxController {
  void autoNavigateToHome() {
    Future.delayed(const Duration(seconds: 10), () {
      Get.offNamed(Routes.HOME);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
