import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
abstract class Todo with _$Todo {
  Todo._();

  factory Todo({
    int id,
    @required String title,
    String description, 
    @Default(0) int complete,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  bool get isComplete => complete == 1 ? true : false;
}
