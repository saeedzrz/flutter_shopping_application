import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shopping_application/common/widgets/bottom_nav.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/screens/mobile_signup_screen.dart';
import 'package:flutter_shopping_application/features/feature_basket/presention/screens/Basket_Screen.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/screens/home_screen.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/screens/profile_screen.dart';
import 'package:flutter_shopping_application/features/future_product/peresentation/screens/category_screen.dart';

class MainWrapper extends StatelessWidget {
  static const routeName = "/main_wrapper";
  MainWrapper({super.key});
  PageController pageController = PageController();
  List<Widget> topLevelScreens = [
    const HomeScreen(),
    const CategoryScreen(),
    ProfileScreen(),
    BasketScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///search Box

          const SizedBox(
            height: 10,
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

///For Search Box
// SafeArea(
      //   child: SizedBox(
      //     height: 600,
      //     child: Column(
      //       children: [
      //         const SizedBox(
      //           height: 10,
      //         ),

      //         /// search Box
      //         Container(
      //           decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //             BoxShadow(
      //                 blurRadius: 2,
      //                 color: Colors.grey.shade400,
      //                 offset: const Offset(0, 3)),
      //           ]),
      //           child: Padding(
      //             padding:
      //                 const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      //             child: SearchTextField(
      //               controller: searchController,
      //               allProductsRepository: locator<AllProductRepository>(),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 10,
      //         ),
