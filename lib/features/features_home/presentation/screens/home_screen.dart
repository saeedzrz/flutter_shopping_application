import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/common/widgets/dot_loading_widget.dart';
import 'package:flutter_shopping_application/config/responsive.dart';
import 'package:flutter_shopping_application/features/features_home/data/models/home_models.dart';
import 'package:flutter_shopping_application/features/features_home/data/picture/banner.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_cubit.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_data_status.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_state.dart';
import 'package:flutter_shopping_application/features/features_home/widget/deep_links.dart';
import 'package:flutter_shopping_application/locator.dart';
import 'package:location/location.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController(initialPage: 0);
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  var lat = 35.69611;
  var lon = 51.42306;
  LocationData? _userLocation;

  Future<void> getUserLocation(BuildContext context) async {
    Location location = Location();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if ((!_serviceEnabled)) {
        BlocProvider.of<HomeCubit>(context).callHomeDataEvent(lat, lon);
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        ///call api with defualt lat lon
        BlocProvider.of<HomeCubit>(context).callHomeDataEvent(lat, lon);
        return;
      }
    }
    final _locationData = await location.getLocation();
    lat = _locationData.latitude!;
    lon = _locationData.longitude!;
    BlocProvider.of<HomeCubit>(context).callHomeDataEvent(lat, lon);
  }

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> banner = [
    const BannerImg(
      image: "assets/images/banner1.jpg",
    ),
    const BannerImg(image: "assets/images/banner2.jpg"),
    const BannerImg(image: "assets/images/banner3.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        locator(),
      ),
      child: Builder(builder: (context) {
        getUserLocation(context);
        return BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) {
          if (previous.homeDataStatus == current.homeDataStatus) {
            return false;
          }
          return true;
        }, builder: (context, state) {
          ///loading
          // if (state.homeDataStatus is HomeDataLoaging) {
          //   return const Center(
          //     child: DotLoadingWidget(size: 30),
          //   );
          // }

          ///complited
          // if (state.homeDataStatus is HomeDataCompleted) {
          //   HomeDataCompleted homeDataCompleted =
          //       state.homeDataStatus as HomeDataCompleted;
          //   HomeModel homeModel = homeDataCompleted.homeModel;
          return SingleChildScrollView(
            child: Column(
              children: [
                /// headerBanner
                SizedBox(
                  height: Responsive.isMobile(context) ? 180 : 300,
                  child: PageView.builder(
                    onPageChanged: (page) {
                      //timer,
                    },
                    allowImplicitScrolling: true,
                    controller: pageViewController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CarouselSlider(
                            items: banner,
                            options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 230,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 8),
                    children: const <Widget>[
                      DeepLink(
                          image: "assets/images/restoran.png",
                          title: "رستوران"),
                      DeepLink(
                          image: "assets/images/shirini.png", title: "شیرینی"),
                      DeepLink(
                          image: "assets/images/supermarket.png",
                          title: "سوپرمارکت"),
                      DeepLink(image: "assets/images/cafe.png", title: "کافه"),
                      DeepLink(image: "assets/images/ajil.png", title: "آجیل"),
                      DeepLink(
                          image: "assets/images/abmivebastani.png",
                          title: "آبمیوه و بستنی"),
                      DeepLink(image: "assets/images/mive.png", title: "میوه"),
                      DeepLink(
                          image: "assets/images/protein.png", title: "پروتیین"),
                    ],
                  ),
                )

                // Center(
                //   child: SmoothPageIndicator(
                //     controller: pageViewController,
                //     count: 3,
                //     effect: ExpandingDotsEffect(
                //         dotWidth: MediaQuery.of(context).size.width * 0.02,
                //         dotHeight: MediaQuery.of(context).size.height * 0.02),
                //   ),
                // )
              ],
            ),
          );
        }

            ///eror
            // if (state.homeDataStatus is HomeDataEror) {
            //   final HomeDataEror homeDataEror =
            //       state.homeDataStatus as HomeDataEror;

            //   return Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           homeDataEror.erorMessage,
            //           style: const TextStyle(color: Colors.white),
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //                 backgroundColor: Colors.amber.shade800),
            //             onPressed: () {
            //               ///call all data again
            //               BlocProvider.of<HomeCubit>(context)
            //                   .callHomeDataEvent();
            //             },
            //             child: const Text("تلاش مجدد"))
            //       ],
            //     ),
            //   );
            // }

            );
      }),
    );
  }
}
