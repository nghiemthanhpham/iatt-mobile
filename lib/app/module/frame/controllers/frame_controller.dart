import 'package:iatt/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FrameController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void navigateToSignIn() {
    Get.toNamed(Routes.HOME);
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
