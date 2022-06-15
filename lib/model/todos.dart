import 'package:json_annotation/json_annotation.dart';

part 'todos.g.dart';

@JsonSerializable()
class Todos {
  final int id;
  final String title;
  @JsonKey(name: 'due_on')
  final String dueOn;
  final String status;

  Todos(
      {required this.id,
      required this.title,
      required this.dueOn,
      required this.status});

  factory Todos.fromJson(Map<String, dynamic> json) => _$TodosFromJson(json);

  Map<String, dynamic> toJson() => _$TodosToJson(this);
}
