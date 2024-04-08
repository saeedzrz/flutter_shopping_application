import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/params/product_params.dart';
import 'package:flutter_shopping_application/features/future_product/data/data_source/product_api_provider.dart';
import 'package:flutter_shopping_application/features/future_product/data/models/all_products_models.dart';

class AllProductRepository {
  ProductApiProvider apiProvider;
  AllProductRepository(this.apiProvider);
  Future<List<Products>> fetchAllProductsDataSearch(ProductsParams) async {
    Response response = await apiProvider.callAllProducts(ProductsParams);
    final AllProductsModel allProductsModel =
        AllProductsModel.fromJson(response.data);

    return allProductsModel.data![0].products!;
  }
}
