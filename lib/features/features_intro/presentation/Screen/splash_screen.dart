import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/common/utills/customSnackbar.dart';
import 'package:flutter_shopping_application/common/utills/prefs_operator.dart';
import 'package:flutter_shopping_application/common/widgets/main_wrapper.dart';
import 'package:flutter_shopping_application/features/features_intro/presentation/Screen/intro_main_wrapper.dart';

import 'package:flutter_shopping_application/features/features_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:flutter_shopping_application/locator.dart';
import 'package:flutter_shopping_application/test_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 300),
                animationDuration: const Duration(seconds: 1),
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                child: Image.asset(
                  'assets/images/sz.JPG',
                  width: width * 0.8,
                ),
              ),
            ),
            BlocConsumer<SplashCubit, SplashState>(builder: (context, State) {
              //if user online
              if (State.connectionStatus is ConnectionInitial ||
                  State.connectionStatus is ConnectionOn) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: LoadingAnimationWidget.prograssiveDots(
                      color: Colors.red, size: 50),
                );
              }
              //if user offline
              // if (State.connectionStatus is ConnectionOff) {
              //   return Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text(
              //         'به اینترنت وصل نیستید ',
              //         style: TextStyle(
              //           color: Colors.red,
              //         ),
              //       ),
              //       IconButton(
              //           onPressed: () {
              //             //check that we are online or not
              //             BlocProvider.of<SplashCubit>(context)
              //                 .checkConnectionEvent();
              //           },
              //           icon: const Icon(
              //             Icons.autorenew,
              //             color: Colors.red,
              //           ))
              //     ],
              //   );
              // }
              // Defualt value
              return Container();
            },
                listener: (context, State) {

                gotoHome();

            }),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Future<void> gotoHome() async {
    PrefsOperator prefsOperator = locator<PrefsOperator>();
    var shouldShowIntro = await prefsOperator.getIntroState();
    return Future.delayed(const Duration(seconds: 3), () {
      if (shouldShowIntro) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          IntroMainWrapper.routeName,
          ModalRoute.withName("intro_main_wrapper"),
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainWrapper.routeName,
          ModalRoute.withName("main_wrapper"),
        );
      }
    });
  }
}
