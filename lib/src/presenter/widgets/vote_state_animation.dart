import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class VoteStateAnimation extends StatelessWidget {
  VoteStateAnimation({Key? key, required this.controller}) : super(key: key) {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.600,
          0.900,
          curve: Curves.ease,
        ),
      ),
    );

    _colorAnimation =
    ColorTween(begin: MyTheme.kSecondaryColor, end: MyTheme.kPrimaryColor).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.600,
          0.900,
          curve: Curves.ease,
        ),
      ),
    );

    _animation = Tween<double>(begin: 3, end: 2 * pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.0,
          0.750,
          curve: Curves.ease,
        ),
      ),
    );
  }

  late final Animation<double> _animation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _opacityAnimation;
  final Animation<double> controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: (context, child){
      return Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateY(_animation.value),
          //  angle: _animation.value,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: _colorAnimation.value),
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: const Icon(Icons.done, size: 18,),
            ),
          ),
        ),
      );
    });
  }
}

