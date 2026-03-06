import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 182, 184),
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Container(
          width: 325,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLabel(),
              const SizedBox(height: 10),
              buildCounterValue(),
              const SizedBox(height: 20),
              buildButtonsRow(),
              const SizedBox(height: 20),
              buildResetButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel() {
    return const Text(
      'Valor atual é:',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }

  Widget buildCounterValue() {
    return Text(
      '$counter',
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }

  Widget buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: decrementCounter,
          child: const Text('Diminuir'),
        ),
        const SizedBox(width: 20),
        ElevatedButton(
          onPressed: incrementCounter,
          child: const Text('Aumentar'),
        ),
      ],
    );
  }

  Widget buildResetButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: resetCounter,
        child: const Text('Resetar'),
      ),
    );
  }
}
