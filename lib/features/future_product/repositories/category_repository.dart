import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/app_exeptions.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';
import 'package:flutter_shopping_application/common/resources/data_state.dart';
import 'package:flutter_shopping_application/features/features_home/data/models/home_models.dart';
import 'package:flutter_shopping_application/features/future_product/data/data_source/category_api_provider.dart';
import 'package:flutter_shopping_application/features/future_product/data/models/categories_model.dart';

class CategoryRepository {
  CategoryApiProvider apiProvider;
  CategoryRepository(this.apiProvider);
  Future<DataState<CategoriesModel>> fetchCategoryData() async {
    try {
      Response response = await apiProvider.callCategories();
      final CategoriesModel categoryModel =
          CategoriesModel.fromJson(response.data);
      return DataSuccess(categoryModel);
    } on AppExeption catch (e) {
      return await CheckExeption.getEror(e);
    }
  }
}
