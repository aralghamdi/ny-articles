
abstract class ResponseState<T> {
  final T? data;
  final dynamic result;
  final String? errorMessage;

  const ResponseState({this.data, this.result, this.errorMessage});
}

class ResponseSuccess<T> extends ResponseState<T> {
  const ResponseSuccess(T data, dynamic result) : super(data: data, result: result);
}

class ResponseFailed<T> extends ResponseState<T> {
  const ResponseFailed(String? errorMessage) : super(errorMessage: errorMessage);
}
