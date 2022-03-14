import 'dart:ui';

import 'package:pros_cons/domain/category/model/category.dart';

class CategoryDTO extends Category {
  const CategoryDTO(
      {required String name, required int index, required int color})
      : super(name: name, index: index, color: color);

  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return CategoryDTO(
        name: json['name'], index: json['index'], color: json['color']);
  }

  Category toModel() {
    return Category(name: name, index: index, color: color);
  }
}
