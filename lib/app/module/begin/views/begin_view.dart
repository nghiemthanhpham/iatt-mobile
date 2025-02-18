import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/module/begin/controllers/begin_controller.dart';

class BeginView extends GetView<BeginController> {
  const BeginView({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Center(
                    child: Text(
                      "Begin Screen",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => controller.autoNavigateToHome(),
                    child: const Icon(Icons.send, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
