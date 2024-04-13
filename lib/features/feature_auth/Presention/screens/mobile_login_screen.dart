import 'package:flutter/material.dart';

class MobileLoginScreen extends StatefulWidget {
  static const routeName = '/mobile_login_screen';
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
