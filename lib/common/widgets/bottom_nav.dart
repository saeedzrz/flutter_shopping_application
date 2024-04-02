import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/common/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.white,
      child: SizedBox(
        height: 72,
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, int state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            /// change selecte  d index
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeSelectedIndex(0);
                            controller.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Image.asset(
                            state == 0
                                ? "assets/images/home_icon.png"
                                : "assets/images/home_icon2.png",
                            color:
                                state == 0 ? Colors.red : Colors.grey.shade700,
                          )),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<BottomNavCubit>(context)
                                .changeSelectedIndex(1);
                            controller.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          icon: Image.asset(
                            state == 1
                                ? "assets/images/category_icon.png"
                                : "assets/images/category_icon2.png",
                            color:
                                state == 1 ? Colors.red : Colors.grey.shade700,
                            width: 40,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 50,
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () async {
                          BlocProvider.of<BottomNavCubit>(context)
                              .changeSelectedIndex(2);
                          controller.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        icon: SvgPicture.asset(
                          state == 2
                              ? "assets/images/person_icon.svg"
                              : "assets/images/person_icon2.svg",
                          color: state == 2 ? Colors.red : Colors.grey.shade700,
                          width: 48,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          BlocProvider.of<BottomNavCubit>(context)
                              .changeSelectedIndex(3);
                          controller.animateToPage(3,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        icon: FaIcon(
                          state == 3
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: state == 3 ? Colors.red : Colors.grey.shade700,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<bool> getDataFromPrefs() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final bool loggedIn = prefs.getBool('user_loggedIn') ?? false;

    return loggedIn;
  }
}
