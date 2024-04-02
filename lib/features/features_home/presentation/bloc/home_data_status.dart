import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/features/features_home/data/models/home_models.dart';

@immutable
abstract class HomeDataStatus {}

class HomeDataInitial extends HomeDataStatus {}

class HomeDataLoaging extends HomeDataStatus {}

class HomeDataCompleted extends HomeDataStatus {
  final HomeModel homeModel;
  HomeDataCompleted(this.homeModel);
}

class HomeDataEror extends HomeDataStatus {
  final String erorMessage;
  HomeDataEror(this.erorMessage);
}
