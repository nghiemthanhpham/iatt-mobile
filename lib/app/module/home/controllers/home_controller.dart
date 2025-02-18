import 'package:get/get.dart';
import 'package:iatt/app/routes/app_pages.dart';

class HomeController extends GetxController {

  void navigateToFrame() {
    Get.toNamed(Routes.FRAME);
  }

  void navigateToAlbum() {
    Get.toNamed(Routes.ALBUM);
  }
}
