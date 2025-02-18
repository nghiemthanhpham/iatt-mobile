import 'package:iatt/app/module/album/bindings/album_binding.dart';
import 'package:iatt/app/module/album/views/album_view.dart';
import 'package:iatt/app/module/begin/bindings/begin_binding.dart';
import 'package:iatt/app/module/begin/views/begin_view.dart';
import 'package:iatt/app/module/frame/views/frame_view.dart';
import 'package:iatt/app/module/frame/bindings/frame_binding.dart';
import 'package:iatt/app/module/home/bindings/home_binding.dart';
import 'package:iatt/app/module/home/views/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.BEGIN;

  static final routes = [
    GetPage(
      name: Routes.BEGIN,
      page: () => const BeginView(),
      binding: BeginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.FRAME,
      page: () => const FrameView(),
      binding: FrameBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.ALBUM,
      page: () => const AlbumView(),
      binding: AlbumBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
