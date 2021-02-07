class ValueOrError<T, E extends Exception> {
  
  final T value;
  final E error;
  
  ValueOrError({this.value, this.error});
  
  bool get hasValue => error != null;
  bool get hasError => error != null;
  
}

extension ValueOrErrorExtension on List<ValueOrError> {
  
  get hasErrors => this.any((element) => element.hasError);
}