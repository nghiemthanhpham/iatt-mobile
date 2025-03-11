import 'package:get/get.dart';
import 'package:iatt/app/module/album/controllers/album_controller.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumController>(
      () => AlbumController(),
    );
  }
}
