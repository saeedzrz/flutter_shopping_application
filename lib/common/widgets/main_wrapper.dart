import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shopping_application/common/widgets/bottom_nav.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  static const routeName = "/main_wrapper";
  MainWrapper({super.key});
  PageController pageController = PageController();
  List<Widget> topLevelScreens = [
    HomeScreen(),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.green,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///search Box

          const SizedBox(
            height: 60,
          ),

          Expanded(
            child: PageView(
              controller: pageController,
              children: topLevelScreens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(controller: pageController),
    );
  }
}
