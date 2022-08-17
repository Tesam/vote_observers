import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vote_observers/src/my_theme.dart';
import 'package:vote_observers/src/presenter/home/role_checker.dart';
import 'package:vote_observers/src/presenter/login/login.screen.dart';
import 'package:vote_observers/src/presenter/providers/global_providers.dart';
import 'package:vote_observers/src/presenter/widgets/csm_button.dart';
import 'package:vote_observers/src/presenter/widgets/vote_state_animation.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;

  final authStateChangesProvider = StreamProvider<User?>(
          (ref) => ref.watch(authRepositoryProvider).authStateChanges);

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
    final authState = ref.watch(authStateChangesProvider);

    return Scaffold(
      backgroundColor: MyTheme.kBackground,
      body: SafeArea(
        child: Column(
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
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                                fontWeight: FontWeight.w600),
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
              child: CSMButton.large(
                buttonTitle: "Empecemos",
                onPressed: (){
                  return authState.maybeWhen(
                    data: (user) =>
                    user != null ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RoleChecker(user: user))) : Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LoginScreen())),
                    orElse: () => Scaffold(
                      appBar: AppBar(),
                      body: const Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
