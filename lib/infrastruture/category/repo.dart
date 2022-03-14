import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:dartz/dartz.dart';
import 'package:pros_cons/domain/category/repo.dart';
import 'package:pros_cons/domain/core/error/error.dart';
import 'package:pros_cons/infrastruture/category/dto/category_dto.dart';

@LazySingleton(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  final Box _categoryBox = Hive.box('category');
  @override
  Future<Either<ProsConsError, Unit>> addCategory(Category category) async {
    try {
      await _categoryBox.put(category.name, category.toMap());
      return const Right(unit);
    } catch (e) {
      return Left(ProsConsError(e.toString()));
    }
  }

  @override
  Future<Either<ProsConsError, Unit>> deleteCategory(Category category) async {
    try {
      await _categoryBox.delete(category.name);
      return const Right(unit);
    } catch (e) {
      return Left(ProsConsError(e.toString()));
    }
  }

  @override
  Future<Either<ProsConsError, List<Category>>> getCategories() async {
    try {
      return Right(
          _categoryBox.values.map((e) => CategoryDTO.fromJson(e)).toList());
    } catch (e) {
      return Left(ProsConsError(e.toString()));
    }
  }
}
