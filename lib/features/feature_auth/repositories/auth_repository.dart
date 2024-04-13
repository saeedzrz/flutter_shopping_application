import 'package:dio/dio.dart';
import 'package:flutter_shopping_application/common/eror_handling/app_exeptions.dart';
import 'package:flutter_shopping_application/common/eror_handling/check_exeptions.dart';

import '../../../common/params/signup_params.dart';
import '../../../common/resources/data_state.dart';
import '../data/data_source/auth_api_provider.dart';
import '../models/code_model.dart';
import '../models/login_with_sms.dart';
import '../models/signup_model.dart';

class AuthRepository {
  AuthApiProvider apiProvider;
  AuthRepository(this.apiProvider);

  Future<DataState<SignupModel>> fetchSignUpData(
      SignUpParams signUpParams) async {
    try {
      Response response = await apiProvider.callSignUp(signUpParams);
      if (response.data['status'].toString() == "success") {
        final SignupModel signupModel = SignupModel.fromJson(response.data);
        return DataSuccess(signupModel);
      } else {
        return DataFeiled(response.data['message']);
      }
    } on AppExeption catch (e) {
      return await CheckExeption.getEror(e);
    }
  }

  Future<DataState<LoginWithSmsModel>> fetchLoginSms(phoneNumber) async {
    try {
      Response response = await apiProvider.callLoginWithSms(phoneNumber);
      if (response.data['status'].toString() != "error") {
        // convert json to models class
        final LoginWithSmsModel loginWithSmsModel =
            LoginWithSmsModel.fromJson(response.data);
        return DataSuccess(loginWithSmsModel);
      } else {
        return DataFeiled(response.data['message']);
      }
    } on AppExeption catch (e) {
      return CheckExeption.getEror(e);
    }
  }

  Future<DataState<CodeModel>> fetchCodeCheckData(code) async {
    try {
      Response response = await apiProvider.callCodeCheck(code);
      final CodeModel codeModel = CodeModel.fromJson(response.data);
      return DataSuccess(codeModel);
    } on AppExeption catch (e) {
      return CheckExeption.getEror(e);
    }
  }

  Future<DataState<LoginWithSmsModel>> fetchRegisterCodeCheckData(
      mobile) async {
    try {
      Response response = await apiProvider.callRegisterCodeCheck(mobile);
      if (response.data['status'].toString() == "success") {
        // convert json to models class
        final LoginWithSmsModel loginWithSmsModel =
            LoginWithSmsModel.fromJson(response.data);
        return DataSuccess(loginWithSmsModel);
      } else {
        return DataFeiled(response.data["message"]);
      }
    } on AppExeption catch (e) {
      return CheckExeption.getEror(e);
    }
  }
}
