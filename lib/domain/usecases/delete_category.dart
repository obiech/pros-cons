import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:pros_cons/domain/category/repo.dart';
import 'package:pros_cons/domain/core/error/error.dart';
import 'package:pros_cons/domain/usecases/usecases.dart';

@LazySingleton()
class DeleteCategory extends Usecase<Unit, Category> {
  DeleteCategory(CategoryRepo repo) : super(repo);

  @override
  Future<Either<ProsConsError, Unit>> call(Category params) async {
    return await repo.deleteCategory(params);
  }
}
