import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
            ),
          ),
          SafeArea(
            child: _buildAppBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 0),
          Column(children: [
            Image.asset(
              AppImages.logo,
              width: 60,
            ),
            Image.asset(
              AppImages.title,
              width: 350,
            ),
          ]),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => controller.navigateToFrame(),
            child: const Icon(Icons.filter_frames, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => controller.navigateToAlbum(),
            child: const Icon(Icons.album, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
