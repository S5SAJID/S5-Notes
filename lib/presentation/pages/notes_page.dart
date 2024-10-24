import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/widgets/notes/new_note_modal.dart';
import 'package:s5_notes/presentation/widgets/notes/notes_tile_popup.dart';
import 'package:s5_notes/utils/utils.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key, required this.onNoteSelected, this.currentNote});
  final Function onNoteSelected;
  final int? currentNote;
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => const NewNoteModal(),
    );
  }

  @override
  void initState() {
    Provider.of<DatabaseProvider>(context, listen: false).initAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DatabaseProvider dbProvider = Provider.of<DatabaseProvider>(context);
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        leadingWidth: 200,
        // TODO: Add Search feature
        // leading: Container(
        //   width: 200,
        //   margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        //   height: 10,
        //   child: const TextField(
        //     decoration: InputDecoration(
        //       hintText: 'Search notes',
        //       contentPadding: EdgeInsets.symmetric(horizontal: 10)
        //     ),
        //   ),
        // ),
        actions: const [
          // IconButton(onPressed: addNewNote, icon: const Icon(Icons.create)),
          // MAKE: Make more accessible
          // IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final note = dbProvider.notes.reversed.toList()[index];
          return ListTile(
            onTap: () => widget.onNoteSelected(note.id),
            title: Text(
              note.title,
              style: theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(Utils.getFormatedDate(note.createdAt)),
            trailing: NoteTilePopupMenu(note: note),
          );
        },
        itemCount: dbProvider.notes.length,
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: addNewNote,
        child: const Icon(Icons.create),
      ),
    );
  }
}
