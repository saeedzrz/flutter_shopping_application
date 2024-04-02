import 'package:flutter/material.dart';

class BannerImg extends StatelessWidget {
  final String image;
  const BannerImg({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
