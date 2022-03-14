import 'package:dartz/dartz.dart';
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:pros_cons/domain/core/error/error.dart';

abstract class CategoryRepo {
  Future<Either<ProsConsError, List<Category>>> getCategories();
  Future<Either<ProsConsError, Unit>> addCategory(Category category);
  Future<Either<ProsConsError, Unit>> deleteCategory(Category category);
}
