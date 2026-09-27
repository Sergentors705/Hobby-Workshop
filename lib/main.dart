import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';
import 'package:hobby_workshop/widgets/miniature_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }

  // This widget is the root of your application.
}

class _MyAppState extends State<MyApp> {
  final List<Miniature> miniatures = [
    Miniature(
      name: 'Captain',
      game: 'Warhammer 40000',
      faction: 'Space Marines',
      status: Status.painted,
    ),
    Miniature(
      name: 'Terminator squad',
      game: 'Warhammer 40000',
      faction: 'Space Marines',
      status: Status.painted,
    ),
    Miniature(
      name: 'Redemptor Dreadnought',
      game: 'Warhammer 40000',
      faction: 'Space Marines',
      status: Status.painted,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hobby Workshop',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Column(
        children: [
          Column(
            children: [
              Text('Hobby Workshop'),
              for (final miniature in miniatures)
                MiniatureCard(miniature: miniature),
            ],
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              miniatures.add(
                Miniature(
                  name: 'Repulsor Executioneer',
                  game: 'Warhammer 40000',
                  faction: 'Space Marines',
                  status: Status.painted,
                ),
              );
            }),
            child: Text('Add test miniature'),
          ),
        ],
      ),
    );
  }
}
