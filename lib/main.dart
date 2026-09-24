import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final miniature = Miniature(
    name: 'Captain',
    game: 'Warhammer 40000',
    faction: 'Space Marines',
    status: Status.painted,
  );
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hobby Workshop',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Column(
        children: [
          Text('Hobby Workshop'),
          Text(miniature.name),
          Text(miniature.game),
          Text(miniature.faction),
          Text(miniature.status.name),
        ],
      ),
    );
  }
}
