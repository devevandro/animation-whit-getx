import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/animation_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      ControllerAnimation(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(
              controller.animationController,
            ),
            child: const SizedBox(
              width: 300,
              height: 300,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/vinyl.png'),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.startAnimation();
            },
            child: Obx(
              () => Text(
                controller.isAnimating.value ? 'stop' : 'start',
              ),
            ),
          ),
        ],
      )),
    );
  }
}
