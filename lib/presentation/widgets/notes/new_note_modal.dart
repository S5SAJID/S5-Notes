import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/modals/note_model.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/widgets/global/Toast.dart';

class NewNoteModal extends StatefulWidget {
  const NewNoteModal({super.key});

  @override
  State<NewNoteModal> createState() => _NewNoteModalState();
}

class _NewNoteModalState extends State<NewNoteModal> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvder = Provider.of<DatabaseProvider>(context, listen: false);

    void onSubmit() async {
      if (_controller.text.isEmpty) {
        return;
      }
      final note = NoteModel(
        title: _controller.text.trim(),
        content: "",
        createdAt: DateTime.now().toString(),
        description: "",
      );
      dbProvder.addNote(note);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        toast(context, const Text('New note created')),
      );
    }

    return AlertDialog(
      title: const Text("Create new note"),
      titleTextStyle: Theme.of(context).textTheme.titleMedium,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (e) async => onSubmit,
            decoration: const InputDecoration(
              hintText: "Note title",
            ),
          ),
        ],
      ),
      actions: [
        FilledButton.tonal(
          onPressed: Navigator.of(context).pop,
          child: const Text("Close"),
        ),
        FilledButton(
          onPressed: onSubmit,
          child: const Text("Create"),
        ),
      ],
    );
  }
}
