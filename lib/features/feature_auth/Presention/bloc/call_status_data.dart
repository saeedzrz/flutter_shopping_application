import 'package:flutter/material.dart';

import '../../models/login_with_sms.dart';

@immutable
abstract class CallCodeStatus {}

class CallCodeInitial extends CallCodeStatus {}

class CallCodeLoading extends CallCodeStatus {}

class CallCodeCompleted extends CallCodeStatus {
  final LoginWithSmsModel loginWithSmsModel;
  CallCodeCompleted(this.loginWithSmsModel);
}

class CallCodeError extends CallCodeStatus {
  final String errorMessage;
  CallCodeError(this.errorMessage);
}
