import 'package:dio/dio.dart';

extension RequireDataResponse<T> on Response<T> {
  T get requireData {
    final data = this.data;
    if (data == null) {
      throw EmptyResponseDioError(this);
    }

    return data;
  }
}

class EmptyResponseDioError extends DioException {
  EmptyResponseDioError(Response<dynamic> response)
    : super(
        requestOptions: response.requestOptions,
        response: response,
        error: Exception('Response data is empty'),
      );
}
