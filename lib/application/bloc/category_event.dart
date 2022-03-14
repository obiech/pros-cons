part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.started() = _Started;
  const factory CategoryEvent.add(Category category) = _Add;
  const factory CategoryEvent.delete(Category category) = _Delete;
  const factory CategoryEvent.getCategories() = _GetCategories;
}
