import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_data_status.dart';
import 'package:flutter_shopping_application/features/feature_auth/Presention/bloc/signup_event.dart';

import '../../../../common/resources/data_state.dart';
import '../../repositories/auth_repository.dart';
import 'call_status_data.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthRepository authRepository;
  SignupBloc(this.authRepository)
      : super(SignupState(
          signUpDataStatus: SignUpDataInitial(),
          callCodeStatus: CallCodeInitial(),
        )) {
    on<LoadSignUp>((event, emit) async {
      /// emit loading
      emit(state.copyWith(
        newSignUpDataStatus: SignUpDataLoading(),
      ));

      DataState dataState =
          await authRepository.fetchSignUpData(event.signUpParams);

      if (dataState is DataSuccess) {
        /// emit completed
        emit(state.copyWith(
          newSignUpDataStatus: SignUpCompleted(dataState.data),
        ));
      }

      if (dataState is DataFeiled) {
        /// emit error
        emit(state.copyWith(
          newSignUpDataStatus: SignUpDataError(dataState.eror!),
        ));
      }
    });

    on<LoadRegisterCodeCheck>((event, emit) async {
      /// emit loading
      emit(state.copyWith(
        newCallCodeStatus: CallCodeLoading(),
      ));

      DataState dataState =
          await authRepository.fetchRegisterCodeCheckData(event.mobile);

      if (dataState is DataSuccess) {
        /// emit completed
        emit(state.copyWith(
          newCallCodeStatus: CallCodeCompleted(dataState.data),
        ));
      }

      if (dataState is DataFeiled) {
        /// emit error
        emit(state.copyWith(
          newCallCodeStatus: CallCodeError(dataState.eror!),
        ));
      }
    });
  }
}
