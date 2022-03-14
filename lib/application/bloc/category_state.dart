part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState(
      {required ProsConsError error,
      required State state,
      required List<Category> categories}) = _CategoryState;
  factory CategoryState.initial() => const CategoryState(
      error: ProsConsError('Unknown Error'),
      state: State.waiting,
      categories: [Category.empty()]);
}
