import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';
import 'package:hobby_workshop/widgets/miniature_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final miniature1 = Miniature(
    name: 'Captain',
    game: 'Warhammer 40000',
    faction: 'Space Marines',
    status: Status.painted,
  );
  final miniature2 = Miniature(
    name: 'Terminator squad',
    game: 'Warhammer 40000',
    faction: 'Space Marines',
    status: Status.painted,
  );
  final miniature3 = Miniature(
    name: 'Redemptor Dreadnought',
    game: 'Warhammer 40000',
    faction: 'Space Marines',
    status: Status.painted,
  );
  List<Miniature> get miniatures => [miniature1, miniature2, miniature3];

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
          for (final miniature in miniatures)
            MiniatureCard(miniature: miniature),
        ],
      ),
    );
  }
}
