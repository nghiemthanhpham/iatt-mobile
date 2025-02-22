import 'package:flutter/material.dart';
import 'package:iatt/app/core/app_colors.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FrameController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final RxInt selectedIndex_tab_3 = 0.obs;
  final RxInt selectedIndex_tab_4 = 0.obs;
  final RxBool isLoading = false.obs;

  final RxList<String> options_tab_3 =
      ['Gốc', 'Tải lên', 'Núi Phú Sĩ', 'Tháp Eiffel', 'Cầu Vàng'].obs;

  final RxList<String> options_tab_4 =
      ['Gốc', 'Sáng tạo', 'Đặc sắc', 'Độc lạ', 'Trẻ em'].obs;

  void setSelectedIndex_tab_3(int index) {
    selectedIndex_tab_3.value = index;
  }

  void setSelectedIndex_tab_4(int index) {
    selectedIndex_tab_4.value = index;
  }

  void showSuccessDialog() {
    isLoading.value = true;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.logo,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 24),
              const Text(
                'Thành công',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.quarter,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Chúng tôi sẽ chuyển\nhướng bạn đến website',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.quarter),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.back();
    });
  }

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
