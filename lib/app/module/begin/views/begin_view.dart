import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/begin/controllers/begin_controller.dart';

class BeginView extends GetView<BeginController> {
  const BeginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: _buildContent(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.title,
            width: 300,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Obx(
                () => LinearProgressIndicator(
                  value: controller.progressValue.value,
                  backgroundColor: const Color(0xFFffffff),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    controller.progressColor.value,
                  ),
                  minHeight: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
