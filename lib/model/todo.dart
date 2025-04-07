import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todosList = []; // Esta será usada por todoList()

  // Esta función la llamas desde main o initState antes de usar todoList()
  static Future<void> fetchAndPopulateTodos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        todosList.clear();

        for (var item in data.take(20)) {
          todosList.add(
            ToDo(
              id: item['id'].toString(),
              todoText: item['title'],
              isDone: item['completed'],
            ),
          );
        }
      } else {
        print('Error al cargar los todos desde la API: ${response.statusCode}');
      }
    } catch (error) {
      print('Error de conexión o al procesar la respuesta: $error');
    }
  }

  static List<ToDo> todoList() {
    return todosList.isEmpty
        ? []
        : todosList;
  }
}