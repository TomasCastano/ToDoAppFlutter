class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Hacer el desayuno', isDone: true ),
      ToDo(id: '02', todoText: 'Ir al cable', isDone: true ),
      ToDo(id: '03', todoText: 'Trabajar', ),
      ToDo(id: '04', todoText: 'Hacer el proyecto de flutter', ),
    ];
  }
}