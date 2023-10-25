import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ny_articles/core/data/remote/response_state.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiRepository {

  @protected
  Future<ResponseState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      return ResponseSuccess(httpResponse.data, httpResponse.response.data);
    } on DioException catch (error) {
      return ResponseFailed(_mapErrorMessage(error));
    } catch (err, st){
      debugPrint(err.toString());
      debugPrintStack(stackTrace: st);
      return ResponseFailed(err.toString());
    }
  }

  String? _mapErrorMessage(DioException exception){
    try {
      var data = exception.response?.data;
      return data?['fault']?['faultstring'];
    } catch (e){
      return null;
    }
  }
}