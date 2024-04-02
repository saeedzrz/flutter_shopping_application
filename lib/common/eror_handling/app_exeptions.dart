import 'package:dio/dio.dart';

class AppExeption implements Exception {
  final message;
  Response? response;

  AppExeption({required this.message, this.response});

  String getMessage() {
    return "$message";
  }
}

class ServerException extends AppExeption {
  ServerException({String? message})
      : super(message: message ?? "مشکلی پیش آمده لطفا دوباره امتحان کنید ");
}

class NotFoundException extends AppExeption {
  NotFoundException({String? message})
      : super(message: message ?? "صفحه مورد نظر یافت نشد ");
}

class DataParsingException extends AppExeption {
  DataParsingException({String? message})
      : super(message: message ?? " Data has corrupted");
}

class BadRequestException extends AppExeption {
  BadRequestException({String? message, required Response response})
      : super(message: message ?? "please check your connection ... ");
}

class FetchDataException extends AppExeption {
  FetchDataException({String? message})
      : super(message: message ?? "please chek your connection ... ");
}

class UnauthorisedExeption extends AppExeption {
  UnauthorisedExeption({String? message})
      : super(message: message ?? "token has been expired");
}
