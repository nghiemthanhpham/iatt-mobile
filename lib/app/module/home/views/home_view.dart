import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/home/views/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iatt/app/module/home/views/product_tab.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBody() {
    return Obx(
      () => IndexedStack(
        index: controller.selectedIndex.value,
        children: const [
          HomeTab(),
          ProductTab(),
          HomeTab(),
          HomeTab(),
          HomeTab(),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
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
          selectedItemColor: const Color(0xFF145496),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
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
        icon: AppImages.add,
        activeIcon: AppImages.add,
        label: 'Trang chủ',
      ),
      _buildNavigationItem(
        icon: AppImages.add,
        activeIcon: AppImages.add,
        label: 'Sản phẩm',
      ),
      _buildNavigationItem(
        icon: AppImages.add,
        activeIcon: AppImages.add,
        label: 'Nhiệm vụ',
      ),
      _buildNavigationItem(
        icon: AppImages.add,
        activeIcon: AppImages.add,
        label: 'Chat',
      ),
      _buildNavigationItem(
        icon: AppImages.add,
        activeIcon: AppImages.add,
        label: 'Cá nhân',
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
        builder: (context) => SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          color: Theme.of(context).unselectedWidgetColor,
        ),
      ),
      activeIcon: Builder(
        builder: (context) => SvgPicture.asset(
          activeIcon,
          width: 24,
          height: 24,
        ),
      ),
      label: label,
    );
  }
}
