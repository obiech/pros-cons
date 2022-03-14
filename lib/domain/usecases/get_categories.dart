import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:pros_cons/domain/category/repo.dart';
import 'package:pros_cons/domain/core/error/error.dart';
import 'package:pros_cons/domain/core/no_params.dart';
import 'package:pros_cons/domain/usecases/usecases.dart';

@LazySingleton()
class GetCategories extends Usecase<List<Category>, NoParams> {
  GetCategories(CategoryRepo repo) : super(repo);

  @override
  Future<Either<ProsConsError, List<Category>>> call(NoParams params) async {
    return await repo.getCategories();
  }
}
