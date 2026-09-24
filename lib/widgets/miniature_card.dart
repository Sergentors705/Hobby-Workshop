import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';

class MiniatureCard extends StatelessWidget {
  final Miniature miniature;
  const MiniatureCard({super.key, required this.miniature});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("Name: ${miniature.name}"),
          Text("Game: ${miniature.game}"),
          Text("Faction: ${miniature.faction}"),
          Text("Status: ${miniature.status.name}"),
        ],
      ),
    );
  }
}
