import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String info;
  final String createDate;
  final String imageCover;
  final int count;
  final Color color;

  CategoryModel(
      {this.name,
      this.id,
      this.info,
      this.createDate,
      this.imageCover,
      this.count,
      this.color});

  bool get canDelete => id > 1;

  @override
  List<Object> get props => [
        id,
        name,
        info,
        createDate,
        imageCover,
        count,
        color,
      ];

  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, info: $info, createDate: $createDate, imageCover: $imageCover, count: $count, color: $color}';
  }
}
