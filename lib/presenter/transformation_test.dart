import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class TransformationTest extends StatefulWidget {
  const TransformationTest({Key? key}) : super(key: key);

  @override
  _TransformationTestState createState() => _TransformationTestState();
}

class _TransformationTestState extends State<TransformationTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;

  Color color = MyTheme.redColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );


    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.700,
          0.900,
          curve: Curves.ease,
        ),
      ),
    );

    _colorAnimation =
    ColorTween(begin: MyTheme.redColor, end: MyTheme.primaryColor)
        .animate( CurvedAnimation(
      parent: _controller,
      curve: const Interval(
        0.600, 0.900,
        curve: Curves.ease,
      ),
    ),)
      ..addListener(() {
        setState(() {});
      })..addStatusListener((status) {
      if (status == AnimationStatus.completed) {

      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _animation = Tween<double>(begin: 3, end: 2 * pi).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.0, 0.750,
            curve: Curves.ease,
          ),
        ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {

          // _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(_animation.value),
        //  angle: _animation.value,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: _colorAnimation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Icon(Icons.done),
          ),
        ),
      )
          /* Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: MyTheme.primaryColor
          ),
        ),*/
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //    value = 0.7;
          });
        },
      ),
    );
  }
}
