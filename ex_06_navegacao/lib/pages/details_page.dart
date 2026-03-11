import 'package:flutter/material.dart';
import '../models/profile.dart';

class DetailsPage extends StatelessWidget {
  final Profile profile;

  const DetailsPage({
    super.key,
    required this.profile,
    });


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Center(
        child: Text(profile.name),
      ),
    );
  }
}