import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/model/todos.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoStateInitial extends TodoState {}

class TodoStateLoading extends TodoState {}

class TodoStateLoaded extends TodoState {
  final List<Todos> todos;

  TodoStateLoaded({required this.todos});
}

class TodoStateError extends TodoState {
  final String message;

  TodoStateError({required this.message});
}
