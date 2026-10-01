import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';
import 'package:hobby_workshop/widgets/miniature_card.dart';
import 'package:hobby_workshop/widgets/miniature_form.dart';

class MiniatureListScreen extends StatefulWidget {
  const MiniatureListScreen({super.key});

  @override
  State<MiniatureListScreen> createState() {
    return _MiniatureListScreenState();
  }
}

class _MiniatureListScreenState extends State<MiniatureListScreen> {
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Text('Hobby Workshop'),
                for (final miniature in miniatures)
                  MiniatureCard(miniature: miniature),
              ],
            ),
          ),
          MiniatureForm(
            onAdd: (miniature) {
              setState(() {
                miniatures.add(miniature);
              });
            },
          ),
        ],
      ),
    );
  }
}
