import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/common/params/signup_params.dart';

@immutable
abstract class SignupEvent {}

class LoadSignUp extends SignupEvent {
  final SignUpParams signUpParams;

  LoadSignUp(this.signUpParams);
}

class LoadRegisterCodeCheck extends SignupEvent {
  final String mobile;
  LoadRegisterCodeCheck(this.mobile);
}
