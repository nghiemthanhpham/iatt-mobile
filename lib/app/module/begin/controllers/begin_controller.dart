import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/routes/app_pages.dart';

class BeginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _progressAnimation;

  final Rx<Color> progressColor = Rx<Color>(const Color(0xFF5F34FE));
  final RxDouble progressValue = RxDouble(0.0);

  @override
  void onInit() {
    super.onInit();

    _initAnimations();
    _startNavigationTimer();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _colorAnimation = ColorTween(
      begin: const Color(0xFFB0A0FF),
      end: const Color(0xFF5E42FF),
    ).animate(_animationController);

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.addListener(() {
      progressColor.value = _colorAnimation.value ?? const Color(0xFFB0A0FF);
      progressValue.value = _progressAnimation.value;
    });
  }

  void _startNavigationTimer() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
