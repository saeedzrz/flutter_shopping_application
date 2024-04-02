import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_data_status.dart';

class HomeState {
  HomeDataStatus homeDataStatus;
  HomeState({required this.homeDataStatus});
  HomeState copyWith({
    HomeDataStatus? newHomeDataStatus,
  }) {
    return HomeState(homeDataStatus: newHomeDataStatus ?? homeDataStatus);
  }
}
