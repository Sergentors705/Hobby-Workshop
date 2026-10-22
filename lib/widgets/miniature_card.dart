import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';

class MiniatureCard extends StatelessWidget {
  final Miniature miniature;
  const MiniatureCard({super.key, required this.miniature});
  Color statusColor(Status status) {
    switch (status) {
      case Status.unassembled:
        return Colors.grey;
      case Status.assembled:
        return Colors.green;
      case Status.basecoated:
        return Colors.indigo;
      case Status.painted:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = statusColor(miniature.status);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.image),
          title: Text(miniature.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(miniature.game), Text(miniature.faction)],
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(miniature.status.name, style: TextStyle(color: color)),
          ),
        ),
      ),
    );
  }
}
