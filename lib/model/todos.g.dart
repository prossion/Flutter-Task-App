// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todos _$TodosFromJson(Map<String, dynamic> json) => Todos(
      id: json['id'] as int,
      title: json['title'] as String,
      dueOn: json['due_on'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TodosToJson(Todos instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'due_on': instance.dueOn,
      'status': instance.status,
    };
