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
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _nameController.dispose();
    _gameController.dispose();
    _factionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name:'),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Game cannot be empty';
              }
              return null;
            },
            controller: _gameController,
            decoration: const InputDecoration(labelText: 'Game:'),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Faction cannot be empty';
              }
              return null;
            },
            controller: _factionController,
            decoration: const InputDecoration(labelText: 'Faction:'),
          ),

          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final miniature = Miniature(
                  name: _nameController.text.trim(),
                  game: _gameController.text.trim(),
                  faction: _factionController.text.trim(),
                  status: selectedStatus,
                );
                widget.onAdd(miniature);
                _nameController.clear();
                _gameController.clear();
                _factionController.clear();
              }
            },
            child: Text('Add miniature'),
          ),
        ],
      ),
    );
  }
}
