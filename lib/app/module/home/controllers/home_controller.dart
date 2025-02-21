import 'package:get/get.dart';
import 'package:iatt/app/routes/app_pages.dart';

class HomeController extends GetxController {

  RxString title = 'Home'.obs;

  void changeTitle(String newTitle) {
    title.value = newTitle;
  }

  void navigateToFrame() {
    Get.toNamed(Routes.FRAME);
  }

  void navigateToAlbum() {
    Get.toNamed(Routes.ALBUM);
  }
}
