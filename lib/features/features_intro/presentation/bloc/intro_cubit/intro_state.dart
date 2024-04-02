class IntroState {
  bool showGetStart;

  IntroState({required this.showGetStart});
  IntroState copywith({
    bool? newShowGetStart,
  }) {
    return IntroState(showGetStart: newShowGetStart ?? showGetStart);
  }
}
