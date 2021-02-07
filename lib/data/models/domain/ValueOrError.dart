class ValueOrError<T, E extends Exception> {
  
  final T value;
  final E error;
  
  ValueOrError({this.value, this.error});
  
  bool get hasValue => error != null;
  bool get hasError => error != null;
  
}

extension ValueOrErrorExtension on List<ValueOrError> {
  
  bool get hasErrors => this.any((element) => element.hasError);
  
  String get composedErrors => this.map((e) => e.error.toString())
                                   .reduce((value, element) => value + " " + element);
  
  Exception get firstError => this.firstWhere((element) => element.hasError).error;
}