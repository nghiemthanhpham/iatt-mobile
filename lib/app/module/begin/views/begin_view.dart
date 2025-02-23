import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iatt/app/core/app_images.dart';
import 'package:iatt/app/module/begin/controllers/begin_controller.dart';
import 'package:iatt/app/routes/app_pages.dart';

class BeginView extends StatefulWidget {
  const BeginView({super.key});

  @override
  _BeginViewState createState() => _BeginViewState();
}

class _BeginViewState extends State<BeginView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _progressAnimation;
  final BeginController _beginController = Get.put(BeginController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _colorAnimation = ColorTween(
      begin: const Color(0xFFB0A0FF),
      end: const Color(0xFF5E42FF),
    ).animate(_controller);

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.HOME);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: _buildAppBar(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Image.asset(
            AppImages.title,
            width: 300,
          ),
          const SizedBox(height: 25),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "In ảnh chất lượng cao",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF616161),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: _progressAnimation.value,
                    backgroundColor: const Color(0xFFD9D9F0),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(_colorAnimation.value!),
                    minHeight: 10,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made with ',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 16,
              ),
              Text(
                ' from Vietnam',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
