import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key, required this.currentNote});
  final int currentNote;

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context, listen: true);
    final note = dbProvider.notes.where((a) => a.id == widget.currentNote).first;

    _controller.text = note.content;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () async {
              note.content = _controller.text;
              await dbProvider.updateNote(note);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Note saved successfully'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                hintText: "Write something...",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              minLines: 20,
              maxLines: 30,
            ),
          ],
        ),
      ),

      backgroundColor: Colors.white,
    );
  }
}
