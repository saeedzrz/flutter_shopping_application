import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_application/common/eror_handling/app_exeptions.dart';
import 'package:flutter_shopping_application/common/resources/data_state.dart';
import 'package:flutter_shopping_application/features/features_home/data/models/home_models.dart';

class CheckExeption {
  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response: response);
      case 401:
        throw UnauthorisedExeption();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException();
    }
  }

  static dynamic getEror(AppExeption appExeption) async {
    switch (appExeption.runtimeType) {
      /// return eror came from server
      case BadRequestException:
        return DataFeiled(appExeption.message);

      case NotFoundException:
        return DataFeiled(appExeption.message);

      ///get refresh token and call api again
      case UnauthorisedExeption:
        return DataFeiled(appExeption.message);

      ///server eror
      case ServerException:
        return DataFeiled(appExeption.message);

      ///dio or timeout and etc eror
      case FetchDataException:
        return DataFeiled(appExeption.message);
    }
  }
}
