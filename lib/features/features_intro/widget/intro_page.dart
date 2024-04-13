import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const IntroPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: height * 0.6,
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 500),
            animationDuration: const Duration(seconds: 1),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Text(
              title,
              style: textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 600),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.grey,
                  child: Text(
                    description,
                    style: textTheme.bodyMedium,
                  ))),
        )
      ],
    );
  }
}
