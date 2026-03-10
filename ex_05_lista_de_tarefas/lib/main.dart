import 'package:flutter/material.dart';
import 'models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Tarefas',
      home: Taskpage(),
    );
  }
}

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final List<Task> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask (){
    final String title = taskController.text.trim();

    if (title.isEmpty) {
      return;
    }
    setState(() {
      tasks.add(Task(title: title));
      taskController.clear();
    });

  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [ Row(
            children: [
              Expanded(child: TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  labelText: 'Nova Tarefa',
                ),
              ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: addTask,
                child: const Text('Adicionar'),
              ),
            ],
          )
          ]
        ),
      ),
    );
  }
}
  