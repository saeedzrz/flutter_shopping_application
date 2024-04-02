// TODO Implement this library.
import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/utills/prefs_operator.dart';
import 'package:flutter_shopping_application/features/features_home/data/data_source/home_api_provider.dart';
import 'package:flutter_shopping_application/features/features_home/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(
    PrefsOperator(),
  );

  ///api Provider
  locator.registerSingleton<HomeApiProvider>(
    HomeApiProvider(
      locator(),
    ),
  );

  /// repasitory
  locator.registerSingleton<HomeRepository>(
    HomeRepository(
      locator(),
    ),
  );
}
