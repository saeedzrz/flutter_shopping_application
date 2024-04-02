abstract class DataState<T> {
  final T? data;
  final String? eror;

  const DataState(this.data, this.eror);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data, null);
}

class DataFeiled<T> extends DataState<T> {
  const DataFeiled(String eror) : super(null, eror);
}
