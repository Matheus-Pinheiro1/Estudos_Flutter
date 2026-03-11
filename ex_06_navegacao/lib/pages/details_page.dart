import 'package:flutter/material.dart';
import '../models/profile.dart';

class DetailsPage extends StatelessWidget {
  final Profile profile;

  const DetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 248, 248),
      appBar: AppBar(title: const Text('Detalhes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  color: Colors.black12,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildAvatar(),
                const SizedBox(height: 16),
                buildName(),
                const SizedBox(height: 8),
                buildRole(),
                const SizedBox(height: 16),
                buildCityRow(),
                const SizedBox(height: 16),
                buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAvatar() {
    return const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40));
  }

  Widget buildName() {
    return Text(
      profile.name,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget buildRole() {
    return Text(
      profile.role,
      style: const TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  Widget buildCityRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.location_city, color: Colors.blueAccent),
        const SizedBox(width: 6),
        Text(profile.city),
      ],
    );
  }

  Widget buildDescription() {
    return Text(
      profile.description,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
    );
  }
}
