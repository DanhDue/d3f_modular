import 'package:d3f_dependency_manager/dependency_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'splash_controller.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController();
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Lottie.asset(SharedAssets.lotties.splashAnimation.path,
                controller: _animationController, onLoaded: (composition) {
              _animationController
                ..duration = composition.duration
                ..forward();
              _animationController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  controller.indicateAnimationComplete();
                }
              });
            }, height: Get.height / 4),
          ),
        );
      },
    );
  }
}
