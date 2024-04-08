import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_application/common/resources/data_state.dart';
import 'package:flutter_shopping_application/features/future_product/peresentation/bloc/category_cubit/category_data_status.dart';
import 'package:flutter_shopping_application/features/future_product/peresentation/bloc/category_cubit/category_state.dart';
import 'package:flutter_shopping_application/features/future_product/repositories/category_repository.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryRepository categoryRepository;
  CategoryCubit(this.categoryRepository)
      : super(CategoryState(categoryDataStatus: CategoryDataLoading()));

  Future<void> LoadCategoryEvent() async {
    ///emit loading
    emit(state.copywith(newCategoryDatastatus: CategoryDataLoading()));

    DataState dataState = await categoryRepository.fetchCategoryData();

    if (dataState is DataSuccess) {
      ///emit completed
      emit(state.copywith(
          newCategoryDatastatus: CategoryDataCompleted(dataState.data)));
    }
    if (dataState is DataFeiled) {
      ///emit eror
      emit(state.copywith(
          newCategoryDatastatus: CategoryDataError(dataState.eror!)));
    }
  }
}
