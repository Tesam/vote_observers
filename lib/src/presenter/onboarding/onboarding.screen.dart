import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/src/presenter/widgets/vote_state_animation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController.forward();
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        _animationController2.forward();
        Future.delayed(
          const Duration(milliseconds: 800),
          () {
            _animationController3.forward();
            Future.delayed(
              const Duration(milliseconds: 800),
                  () => _animationController4.forward(),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyTheme.kBackground,
      body: SafeArea(
        child:   Column(
          children: [
            Flexible(
              child: Container(
                width: size.width * 0.7,
                height: double.infinity,
                //color: MyTheme.kPrimaryColor,
                child: const Text(
                  "El estado de tus votantes en tiempo real",
                  style: TextStyle(
                    fontFamily: MyTheme.kFontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.kPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.bottomCenter,
              ),
              flex: 1,
            ),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VoteStateAnimation(
                            controller: _animationController,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Juan Perez",
                            style: TextStyle(
                                fontFamily: MyTheme.kFontFamily,
                                color: MyTheme.kLightColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VoteStateAnimation(
                            controller: _animationController2,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Marta Nuñez",
                            style: TextStyle(
                                fontFamily: MyTheme.kFontFamily,
                                color: MyTheme.kLightColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VoteStateAnimation(
                            controller: _animationController3,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "José Martinez",
                            style: TextStyle(
                                fontFamily: MyTheme.kFontFamily,
                                color: MyTheme.kLightColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VoteStateAnimation(
                            controller: _animationController4,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "Juana Ferreira",
                            style: TextStyle(
                                fontFamily: MyTheme.kFontFamily,
                                color: MyTheme.kLightColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 5,
            ),
            Flexible(
              child: SizedBox(
                width: size.width * 0.75,
                height: 50,
                //color: MyTheme.kLightColor,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: MyTheme.kPrimaryColor, // background
                    onPrimary: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Empecemos',
                    style: TextStyle(
                      color: MyTheme.kBackground,
                      fontSize: 17,
                      fontFamily: MyTheme.kFontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
