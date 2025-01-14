import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/common/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:flutter_shopping_application/common/widgets/main_wrapper.dart';
import 'package:flutter_shopping_application/config/my_theme.dart';
import 'package:flutter_shopping_application/features/features_intro/presentation/Screen/intro_main_wrapper.dart';
import 'package:flutter_shopping_application/features/features_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:flutter_shopping_application/features/features_intro/presentation/Screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shopping_application/locator.dart';
import 'package:flutter_shopping_application/test_screen.dart';

import 'features/feature_auth/Presention/bloc/signup_bloc.dart';
import 'features/feature_auth/Presention/screens/mobile_signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyhttpOverrides();
  await initLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => locator<SignupBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: "/",
      locale: const Locale("fa", ""),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("fa", ""),
      ],
      routes: {
        IntroMainWrapper.routeName: (context) => IntroMainWrapper(),
        MainWrapper.routeName: (context) => MainWrapper(),
        MobileSignUpScreen.routeName: (context) => MobileSignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Online shope',
      home: const SplashScreen(),
    );
  }
}

class MyhttpOverrides extends HttpOverrides {
  @override
  HttpClient creatHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
