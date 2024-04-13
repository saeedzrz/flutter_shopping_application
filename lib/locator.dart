// TODO Implement this library.
import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/utills/prefs_operator.dart';
import 'package:flutter_shopping_application/features/features_home/data/data_source/home_api_provider.dart';
import 'package:flutter_shopping_application/features/features_home/repositories/home_repository.dart';
import 'package:flutter_shopping_application/features/future_product/data/data_source/category_api_provider.dart';
import 'package:flutter_shopping_application/features/future_product/data/data_source/product_api_provider.dart';
import 'package:flutter_shopping_application/features/future_product/repositories/all_product_repository.dart';
import 'package:flutter_shopping_application/features/future_product/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/feature_auth/Presention/bloc/signup_bloc.dart';
import 'features/feature_auth/data/data_source/auth_api_provider.dart';
import 'features/feature_auth/repositories/auth_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(
    PrefsOperator(),
  );

  ///api Provider
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider(locator()));
  locator
      .registerSingleton<CategoryApiProvider>(CategoryApiProvider(locator()));
  locator.registerSingleton<ProductApiProvider>(ProductApiProvider(locator()));
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider(locator<Dio>()));

  /// repasitory
  locator.registerSingleton<HomeRepository>(HomeRepository(locator()));
  locator.registerSingleton<CategoryRepository>(CategoryRepository(locator()));
  locator
      .registerSingleton<AllProductRepository>(AllProductRepository(locator()));
  locator.registerSingleton<AuthRepository>(
      AuthRepository(locator<AuthApiProvider>()));

  /// bloc
  locator.registerSingleton<SignupBloc>(SignupBloc(locator<AuthRepository>()));
}
