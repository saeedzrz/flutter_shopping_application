import 'package:flutter_shopping_application/features/future_product/peresentation/bloc/category_cubit/category_data_status.dart';

class CategoryState {
  CategoryDataStatus categoryDataStatus;
  CategoryState({required this.categoryDataStatus});

  CategoryState copywith({
    CategoryDataStatus? newCategoryDatastatus,
  }) {
    return CategoryState(
        categoryDataStatus: newCategoryDatastatus ?? categoryDataStatus);
  }
}
