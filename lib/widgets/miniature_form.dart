import 'package:flutter/material.dart';
import 'package:hobby_workshop/models/miniature.dart';

class MiniatureForm extends StatefulWidget {
  final ValueChanged<Miniature> onAdd;
  const MiniatureForm({super.key, required this.onAdd});
  @override
  State<MiniatureForm> createState() {
    return _MiniatureFormState();
  }
}

class _MiniatureFormState extends State<MiniatureForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameController = TextEditingController();
  final TextEditingController _factionController = TextEditingController();
  Status selectedStatus = Status.painted;
  @override
  void dispose() {
    _nameController.dispose();
    _gameController.dispose();
    _factionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<Status>(
          value: selectedStatus,
          onChanged: (value) {
            setState(() {
              selectedStatus = value!;
            });
          },
          items: [
            DropdownMenuItem<Status>(
              value: Status.unassembled,
              child: Text('Unassebled'),
            ),
            DropdownMenuItem<Status>(
              value: Status.assembled,
              child: Text('Assembled'),
            ),
            DropdownMenuItem<Status>(
              value: Status.basecoated,
              child: Text('Basecoated'),
            ),
            DropdownMenuItem<Status>(
              value: Status.painted,
              child: Text('Painted'),
            ),
          ],
        ),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name:'),
        ),
        TextField(
          controller: _gameController,
          decoration: const InputDecoration(labelText: 'Game:'),
        ),
        TextField(
          controller: _factionController,
          decoration: const InputDecoration(labelText: 'Faction:'),
        ),
        ElevatedButton(
          onPressed: () {
            final miniature = Miniature(
              name: _nameController.text,
              game: _gameController.text,
              faction: _factionController.text,
              status: selectedStatus,
            );
            widget.onAdd(miniature);
          },
          child: Text('Add miniature'),
        ),
      ],
    );
  }
}
