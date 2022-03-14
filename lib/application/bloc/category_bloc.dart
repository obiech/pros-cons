import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pros_cons/application/core/state.dart';
import 'package:pros_cons/domain/category/model/category.dart';
import 'package:pros_cons/domain/category/repo.dart';
import 'package:pros_cons/domain/core/error/error.dart';
import 'package:pros_cons/domain/core/no_params.dart';
import 'package:pros_cons/domain/usecases/add_categories.dart';
import 'package:pros_cons/domain/usecases/delete_category.dart';
import 'package:pros_cons/domain/usecases/get_categories.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;
  final AddCategory addCategory;
  final DeleteCategory deleteCategory;
  CategoryBloc(this.getCategories, this.addCategory, this.deleteCategory)
      : super(CategoryState.initial()) {
    on<_Add>(_onAdd);
    on<_Delete>(_onDelete);
    on<_GetCategories>(_onGetCategories);
  }

  void _onAdd(_Add event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(state: State.loading));
    final res = await addCategory(event.category);
    res.fold((l) => emit(state.copyWith(error: l, state: State.failed)),
        (r) => emit(state.copyWith(state: State.success)));
  }

  void _onDelete(_Delete event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(state: State.loading));
    final res = await deleteCategory(event.category);
    res.fold((l) => emit(state.copyWith(error: l, state: State.failed)),
        (r) => emit(state.copyWith(state: State.success)));
  }

  void _onGetCategories(
      _GetCategories event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(state: State.loading));
    final res = await getCategories(NoParams());
    res.fold((l) => emit(state.copyWith(error: l, state: State.failed)),
        (r) => emit(state.copyWith(categories: r, state: State.success)));
  }
}
