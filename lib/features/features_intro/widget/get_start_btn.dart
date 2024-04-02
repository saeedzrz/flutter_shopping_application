import 'package:flutter/material.dart';

class GetStartBtn extends StatefulWidget {
  final String text;
  final Function ontap;
  const GetStartBtn({super.key, required this.text, required this.ontap});

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn>
    with TickerProviderStateMixin {
  late AnimationController fadeController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(
      value: 0,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    fadeAnimation = CurvedAnimation(parent: fadeController, curve: Curves.ease);
    fadeController.forward();
  }

  void dipose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SizedBox(
        height: 45,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 85, 123, 192),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            widget.ontap();
          },
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
