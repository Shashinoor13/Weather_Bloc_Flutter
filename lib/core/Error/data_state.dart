abstract class DataState<T> {
  final T? data;
  final String? message;
  final bool? isSuccessful;

  DataState({
    this.data,
    this.message,
    this.isSuccessful,
  });
}

class DataInitial<T> extends DataState<T> {
  DataInitial() : super(isSuccessful: false);
}

class DataLoading<T> extends DataState<T> {
  DataLoading() : super(isSuccessful: false);
}

class DataLoaded<T> extends DataState<T> {
  DataLoaded({required T data}) : super(data: data, isSuccessful: true);
}

class DataError<T> extends DataState<T> {
  DataError({required String message})
      : super(message: message, isSuccessful: false);
}

class DataEmpty<T> extends DataState<T> {
  DataEmpty() : super(isSuccessful: false);
}

class DataNoInternet<T> extends DataState<T> {
  DataNoInternet() : super(isSuccessful: false);
}
