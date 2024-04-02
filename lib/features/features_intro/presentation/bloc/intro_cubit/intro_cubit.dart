import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/features/features_intro/presentation/bloc/intro_cubit/intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit()
      : super(
          IntroState(showGetStart: false),
        );
  void changeGetStart(bool value) =>
      emit(state.copywith(newShowGetStart: value));
}
