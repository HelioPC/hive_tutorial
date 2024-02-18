abstract class Failure {
  final String message;

  Failure({required this.message});
}

class SomeSpecificError extends Failure {
  SomeSpecificError({required super.message});
}
