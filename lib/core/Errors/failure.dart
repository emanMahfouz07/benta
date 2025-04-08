import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Connection Timeout with Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Connection Timeout with Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled with Server');
      case DioExceptionType.connectionError:
        return ServerFailure(
          'There was error in connection with server, try again!',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure('Unexpercted Error please try again later');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpercted Error please try again later');
      default:
        return ServerFailure('Opps! there was an error, try again!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not found! Try again later :D');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error , please try agian later');
    } else {
      return ServerFailure('Opps! there was an error, try again!');
    }
  }
}
