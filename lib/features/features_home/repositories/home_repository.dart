import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/app_exeptions.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';
import 'package:flutter_shopping_application/features/features_home/data/data_source/home_api_provider.dart';
import 'package:flutter_shopping_application/features/features_home/data/models/home_models.dart';

import '../../../common/resources/data_state.dart';

class HomeRepository {
  HomeApiProvider apiProvider;
  HomeRepository(this.apiProvider);

  Future<DataState<HomeModel>> fetchHomeData(lat, lon) async {
    try {
      Response response = await apiProvider.callHomeData(lat, lon);
      final HomeModel homeModel = HomeModel.fromJson(response.data);
      return DataSuccess(homeModel);
    } on AppExeption catch (e) {
      return await CheckExeption.getEror(e);
    }
  }
}
