import 'package:equatable/equatable.dart';

class ProsConsError extends Equatable {
  final String error;

  const ProsConsError(this.error);

  @override
  List<Object?> get props => [error];
}
