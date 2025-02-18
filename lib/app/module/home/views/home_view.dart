import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/module/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Center(
            child: Text(
              "Home Screen",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
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
