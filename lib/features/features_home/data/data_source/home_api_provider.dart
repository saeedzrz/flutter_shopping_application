import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';
import 'package:flutter_shopping_application/config/constants.dart';

class HomeApiProvider {
  Dio dio;
  HomeApiProvider(this.dio);

  dynamic callHomeData(lat, lon) async {
    final response =
        await dio.get("${Constants.baseUrl}/mainData", queryParameters: {
      "lat": lat,
      "lon": lon,
    }).onError((DioError error, stackTrace) {
      return CheckExeption.response(error.response!);
    });

    log(response.toString() as num);
    return response;
  }
}
