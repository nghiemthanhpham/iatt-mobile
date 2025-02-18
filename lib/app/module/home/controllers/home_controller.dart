import 'package:get/get.dart';
import 'package:iatt/app/routes/app_pages.dart';

class HomeController extends GetxController {

  void navigateToFrame() {
    Get.toNamed(Routes.FRAME);
  }

  void navigateToAlbum() {
    Get.toNamed(Routes.ALBUM);
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
