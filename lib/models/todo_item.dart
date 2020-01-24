import 'package:flutter/material.dart';

class TodoItem {
  final String descricao;
  bool done = false;

  TodoItem({@required this.descricao});
}