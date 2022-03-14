import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String name;
  final int index;
  final int color;
  const Category(
      {required this.name, required this.index, required this.color});

  const Category.empty({this.index = 0, this.color = 10, this.name = ''});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'index': index,
      'color': color,
    };
  }

  @override
  List<Object?> get props => [name, index, color];
}
