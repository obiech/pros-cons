// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/bloc/category_bloc.dart' as _i8;
import 'domain/category/repo.dart' as _i3;
import 'domain/usecases/add_categories.dart' as _i7;
import 'domain/usecases/delete_category.dart' as _i5;
import 'domain/usecases/get_categories.dart' as _i6;
import 'infrastruture/category/repo.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CategoryRepo>(() => _i4.CategoryRepoImpl());
  gh.lazySingleton<_i5.DeleteCategory>(
      () => _i5.DeleteCategory(get<_i3.CategoryRepo>()));
  gh.lazySingleton<_i6.GetCategories>(
      () => _i6.GetCategories(get<_i3.CategoryRepo>()));
  gh.lazySingleton<_i7.AddCategory>(
      () => _i7.AddCategory(get<_i3.CategoryRepo>()));
  gh.factory<_i8.CategoryBloc>(() => _i8.CategoryBloc(get<_i6.GetCategories>(),
      get<_i7.AddCategory>(), get<_i5.DeleteCategory>()));
  return get;
}
