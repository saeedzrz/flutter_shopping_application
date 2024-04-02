import 'package:bloc/bloc.dart';
import 'package:flutter_shopping_application/common/resources/data_state.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_data_status.dart';
import 'package:flutter_shopping_application/features/features_home/presentation/bloc/home_state.dart';
import 'package:flutter_shopping_application/features/features_home/repositories/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository)
      : super(
          HomeState(
            homeDataStatus: HomeDataLoaging(),
          ),
        );
  Future<void> callHomeDataEvent(lat, lon) async {
    emit(
      state.copyWith(
        newHomeDataStatus: HomeDataLoaging(),
      ),
    );
    DataState dataState = await homeRepository.fetchHomeData(lat, lon);

    if (dataState is DataSuccess) {
      ///emitComplited
      emit(
        state.copyWith(
          newHomeDataStatus: HomeDataCompleted(dataState.data),
        ),
      );
    }
    if (dataState is DataFeiled) {
      ///emitEror
      emit(
        state.copyWith(
          newHomeDataStatus: HomeDataEror(dataState.eror!),
        ),
      );
    }
  }
}
