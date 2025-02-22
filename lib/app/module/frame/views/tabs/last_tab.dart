import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/core/app_colors.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/frame/controllers/frame_controller.dart';
import 'package:sizer/sizer.dart';

class LastTab extends GetView<FrameController> {
  const LastTab({super.key});

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
          _buildObx(context),
        ],
      ),
    );
  }

  Widget _buildObx(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 7.h),
        _buildHeader(context),
        Expanded(child: _buildBody(context)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: List.generate(
                  controller.options_tab_4.length,
                  (index) => _buildImageOption(index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.navigateToSignIn();
            },
            child: Image.asset(
              AppImages.back,
              width: 55,
              height: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    AppImages.undo_redo,
                    width: 55,
                    height: 25,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    AppImages.reset,
                    width: 55,
                    height: 25,
                  ),
                ),
                GestureDetector(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: Image.asset(
                      AppImages.undo_redo,
                      width: 55,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.showSuccessDialog();
            },
            child: Container(
              width: 19.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.quarter,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Tiếp tục",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromARGB(255, 203, 203, 203),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 65, vertical: 190),
              child: Image.asset(
                AppImages.waiting_image_main,
                width: 50.w,
                height: 10.h,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildImageOption(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.setSelectedIndex_tab_4(index),
        child: Container(
          margin: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: controller.selectedIndex_tab_4.value == index
                        ? Colors.purple
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _buildOptionContent(index),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                controller.options_tab_4[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: controller.selectedIndex_tab_4.value == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: controller.selectedIndex_tab_4.value == index
                      ? Colors.purple
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionContent(int index) {
    switch (index) {
      case 0:
        return Stack(
          children: [
            Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Image.asset(
                  AppImages.banned,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        );
      default:
        return Container(
          color: Colors.white,
          child: Center(
            child: Image.asset(
              AppImages.waiting_image_main,
              width: 20,
              height: 20,
            ),
          ),
        );
    }
  }
}

class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final circle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    final line = Path()
      ..moveTo(size.width / 2, size.height / 4)
      ..lineTo(size.width / 2, size.height * 3 / 4);

    canvas.drawPath(circle, paint);
    canvas.drawPath(line, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
