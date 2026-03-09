import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImcPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  double? _imc;
  String aviso = 'Preencha os campos para calcular seu IMC';

  String getImcClassification(double value) {
    if (value < 18.5) {
      return 'Abaixo do peso';
    }
    if (value < 25) {
      return 'Peso normal(Eutrófico)';
    }
    if (value < 30) {
      return 'Sobrepeso';
    }
    if (value < 35) {
      return 'Obesidade Grau I';
    }
    if (value < 40) {
      return 'Obesidade Grau II';
    }
    return 'Obesidade Grau III(Mórbida)';
  }

  void calculateIMC() {
    final String weightText = weightController.text;
    final String heightText = heightController.text;

    if (weightText.isEmpty || heightText.isEmpty) {
      setState(() {
        aviso = 'Preencha peso e altura para calcular o IMC';
        _imc = null;
      });
      return;
    }

    final double? weight = double.tryParse(weightText);
    final double? height = double.tryParse(heightText);

    if (weight == null || height == null) {
      setState(() {
        aviso = 'Digite números válidos para peso e altura.';
        _imc = null;
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        aviso = 'Peso e altura devem ser maiores que zero.';
        _imc = null;
      });
      return;
    }

    final double result = weight / (height * height);
    setState(() {
      _imc = result;
      aviso = 'Resultado do seu IMC';
    });
  }

  void clearFields() {
    setState(() {
      weightController.clear();
      heightController.clear();
      _imc = null;
      aviso = 'Preencha os campos para calcular seu IMC';
    });
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 197, 197),
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Center(
        child: Container(
          width: 340,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Informe seu peso (kg) e altura (m) para calcular seu IMC',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Peso (Kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
               TextField(
                controller: heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Altura (m)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calculateIMC,
                  child: const Text('Calcular IMC'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _imc == null ? aviso : 'Seu IMC é ${_imc!.toStringAsFixed(2)} - ${getImcClassification(_imc!)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                aviso,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
                const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: clearFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('Limpar'),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}