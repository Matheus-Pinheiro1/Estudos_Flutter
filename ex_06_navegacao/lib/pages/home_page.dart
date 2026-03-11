import 'package:flutter/material.dart';
import '../models/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfis'),
      ),
      body: const Center(
        child: Text('lista aqui'),
      ),
    )
  }
}