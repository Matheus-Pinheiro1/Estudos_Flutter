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

  int getCompletedTasks() {
    return tasks.where((task) => task.isDone).length;
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].toggleDone();
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void addTask() {
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
      backgroundColor: const Color.fromARGB(255, 172, 168, 168),
      appBar: AppBar(
        title: const Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildInputSection(),
            const SizedBox(height: 16),
            buildSummaryText(),
            const SizedBox(height: 12),
            buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Nova Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(onPressed: addTask, child: const Text('Adicionar')),
        ],
      ),
    );
  }

  Widget buildSummaryText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Concluídas: ${getCompletedTasks()} de ${tasks.length}',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildTaskList() {
    if (tasks.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'Nenhuma tarefa adicionada',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return buildTaskItem(task, index);
        },
      ),
    );
  }

  Widget buildTaskItem(Task task, int index) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (_) {
            toggleTask(index);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            removeTask(index);
          },
          icon: const Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
