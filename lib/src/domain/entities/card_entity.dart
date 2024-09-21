import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/domain/entities/entity.dart';

class CardEntity implements Entity {
  String id;

  /// [title] es una variable que almacena el titulo de la card
  String title;

  /// [description] es una variable que almacena la descripción de la card
  String description;

  int colorIndex;
  CardEntity(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.colorIndex = 1});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['title'] = title;
    json['description'] = description;
    return json;
  }
}
