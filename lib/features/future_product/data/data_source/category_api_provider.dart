import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';
import 'package:flutter_shopping_application/config/constants.dart';

class CategoryApiProvider {
  Dio dio;
  CategoryApiProvider(this.dio);
  dynamic callCategories() async {
    try {
      final response = await dio.get("${Constants.baseUrl}/categories/tree");
      log(response.toString() as num);
      return response;
    } on DioError catch (e) {
      return CheckExeption.response(e.response!);
    }
  }
}
