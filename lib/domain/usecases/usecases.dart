import 'package:dartz/dartz.dart';
import 'package:pros_cons/domain/category/repo.dart';
import 'package:pros_cons/domain/core/error/error.dart';
import 'package:injectable/injectable.dart';

///Interface for creating easy to use Api.
///A human-readable explanation of the reason why the class is immutable.
// @LazySingleton()
abstract class Usecase<Type, Params> {
  final CategoryRepo repo;

  const Usecase(this.repo);

  Future<Either<ProsConsError, Type>> call(Params params);
}
