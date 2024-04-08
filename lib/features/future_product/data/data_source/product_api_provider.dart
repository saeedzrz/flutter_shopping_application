import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';

import '../../../../common/params/product_params.dart';
import '../../../../config/constants.dart';

class ProductApiProvider {
  Dio dio;
  ProductApiProvider(this.dio);

  dynamic callAllProducts(ProductsParams productparams) async {
    try {
      final response = await dio.post("${Constants.baseUrl}/products", data: {
        "start": productparams.start,
        "step": productparams.step,
        "categories": productparams.categories,
        "maxPrise": productparams.minPrice,
        "sortby": productparams.sortBy,
        'search': productparams.search
      });
      print(response);
      return response;
    } on DioError catch (e) {
      return CheckExeption.response(e.response!);
    }
  }
}
