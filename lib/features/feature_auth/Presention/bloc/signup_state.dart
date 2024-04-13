import 'call_status_data.dart';
import 'signup_data_status.dart';

class SignupState {
  SignUpDataStatus signUpDataStatus;
  CallCodeStatus callCodeStatus;

  SignupState({
    required this.signUpDataStatus,
    required this.callCodeStatus,
  });

  SignupState copyWith({
    SignUpDataStatus? newSignUpDataStatus,
    CallCodeStatus? newCallCodeStatus,
  }) {
    return SignupState(
      signUpDataStatus: newSignUpDataStatus ?? signUpDataStatus,
      callCodeStatus: newCallCodeStatus ?? callCodeStatus,
    );
  }
}
