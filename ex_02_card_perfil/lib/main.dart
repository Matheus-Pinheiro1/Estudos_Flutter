import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
      );
  }
}

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text('Card Perfil')),
        body: Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
                buildAvatar(),
                const SizedBox(height: 15),
                buildName(),
                const SizedBox(height: 5),
                buildInfoRow(),
                const SizedBox(height: 20),
                buildActionButton(),
              ],
            ),
          ),
        ),
      );


}
}

Widget buildAvatar() {
  return const CircleAvatar(
    radius: 45,
    backgroundColor: Colors.blueAccent,
    child: Icon(  
      Icons.person,
      size: 45,
      color: Colors.white,
      ),
    );
}

Widget buildName() {
  return const Text('User Test',
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      ),
    );
}



Widget buildInfoRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: const [
          Icon(Icons.location_on, color: Colors.blueAccent),
          SizedBox(height: 6),
          Text('Brasilia'),
        ],
      ),
      Column(
        children: const [
          Icon(Icons.cake, color: Colors.blueAccent),
          SizedBox(height: 6),
          Text('27 anos'),
        ],
      ),
      Column(
        children: const [
          Icon(Icons.email, color: Colors.blueAccent),
          SizedBox(height: 6),
          Text('usertest@email.com'),
        ],
      ),
        Column(
        children: const [
          Icon(Icons.code, color: Colors.blueAccent),
          SizedBox(height: 6),
          Text('Flutter, Dart, Ruby on Rails'),
        ],
      ),
    ],
  );
}

Widget buildActionButton(){
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      child: const Text('Saiba mais'),
    ),
  );
}