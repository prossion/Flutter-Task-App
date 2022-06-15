import 'dart:convert';

import 'package:flutter_test_app/model/todos.dart';
import 'package:http/http.dart' as http;

class TodosService {
  final http.Client httpClient;

  TodosService({required this.httpClient});

  Future<List<Todos>> getTodos() async {
    final response =
        await httpClient.get(Uri.parse('https://gorest.co.in/public/v2/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> todosJson = json.decode(response.body);
      return todosJson.map((json) => Todos.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching todos');
    }
  }
}
