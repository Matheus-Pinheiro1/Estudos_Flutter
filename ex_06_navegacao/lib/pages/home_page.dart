import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Profile> profiles = const [
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
      backgroundColor: const Color.fromARGB(255, 247, 248, 248),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfis')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];

          return buildProfileItem(context, profile);
        },
      ),
    );
  }


  Widget buildProfileItem(BuildContext context, Profile profile){
    return  Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
                leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.role),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(profile: profile),
                  ),
                );
              },
            ),
          );
  }
}
