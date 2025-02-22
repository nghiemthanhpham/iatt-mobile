import 'package:iatt/app/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iatt/app/module/frame/views/tabs/first_tab.dart';
import 'package:iatt/app/module/frame/views/tabs/last_tab.dart';
import 'package:iatt/app/module/frame/views/tabs/second_tab.dart';
import 'package:iatt/app/module/frame/views/tabs/third_tab.dart';
import '../controllers/frame_controller.dart';

class FrameView extends GetView<FrameController> {
  const FrameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.5),
            ),
          ),
          _buildBody(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => IndexedStack(
        index: controller.selectedIndex.value,
        children: const [
          FirstTab(),
          SecondTab(),
          ThirdTab(),
          LastTab(),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 4, 4, 4),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          selectedLabelStyle: _buildTextStyle(),
          unselectedLabelStyle: _buildTextStyle(),
          iconSize: 24,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          enableFeedback: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          items: _buildNavigationItems(),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.5,
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      _buildNavigationItem(
        icon: AppImages.func_1,
        activeIcon: AppImages.func_1_action,
        label: 'Mịn da',
      ),
      _buildNavigationItem(
        icon: AppImages.func_2,
        activeIcon: AppImages.func_2_action,
        label: 'Chất lượng',
      ),
      _buildNavigationItem(
        icon: AppImages.func_3,
        activeIcon: AppImages.func_3_action,
        label: 'Xoá phông',
      ),
      _buildNavigationItem(
        icon: AppImages.func_4,
        activeIcon: AppImages.func_4_action,
        label: 'Tạo với A.I',
      ),
    ];
  }

  BottomNavigationBarItem _buildNavigationItem({
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Builder(
        builder: (context) => Image.asset(
          icon,
          width: 24,
          height: 24,
          color: Theme.of(context).unselectedWidgetColor,
        ),
      ),
      activeIcon: Builder(
        builder: (context) => Image.asset(
          activeIcon,
          width: 24,
          height: 24,
        ),
      ),
      label: label,
    );
  }
}
