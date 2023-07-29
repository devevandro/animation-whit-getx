import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ControllerAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  RxBool isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
  }

  /* @override
  void onReady() {
    super.onReady();
  } */

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  startAnimation() {
    if (animationController.isAnimating) {
      isAnimating.value = false;
      animationController.stop();
    } else {
      isAnimating.value = true;
      animationController.forward();
      animationController.repeat();
    }
  }
}
