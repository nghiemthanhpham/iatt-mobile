import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/core/app_colors.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/frame/controllers/frame_controller.dart';
import 'package:sizer/sizer.dart';

class SecondTab extends GetView<FrameController> {
  const SecondTab({super.key});

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
        ));
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
        SizedBox(height: 10.h),
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.quarter,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color.fromARGB(255, 203, 203, 203),
                width: 0,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 126, vertical: 16),
              child: Text(
                "Tăng chất lượng",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
