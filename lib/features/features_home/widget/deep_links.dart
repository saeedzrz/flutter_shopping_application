import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/config/responsive.dart';

class DeepLink extends StatelessWidget {
  final String image;
  final String title;
  const DeepLink({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Card(
                child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(fontSize: Responsive.isMobile(context) ? 11 : 18),
        )
      ],
    );
  }
}
