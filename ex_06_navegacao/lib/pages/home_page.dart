import 'package:flutter/material.dart';
import '../models/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Profile> profiles = [
    Profile(
      name: 'Matheus Pinheiro',
      role: 'Dev Flutter',
      city: 'Brasília',
      description: 'Lorem ipsum dolor sit amet',
    ),
    Profile(
      name: 'Taile Maiolino',
      role: 'Biomédica',
      city: 'Uberlândia',
      description: 'Lorem ipsum dolor sit amet',
    ),
    Profile(
      name: 'Luis Eduardo',
      role: 'Dev Mobile',
      city: 'Fortaleza',
      description: 'Lorem ipsum dolor sit amet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfis')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.role),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
