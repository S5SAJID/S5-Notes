
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/modals/note_model.dart';
import 'package:s5_notes/data/providers/database_provider.dart';

class NoteTilePopupMenu extends StatelessWidget {
  const NoteTilePopupMenu({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
     final DatabaseProvider dbProvider = Provider.of<DatabaseProvider>(context, listen: false);
    return PopupMenuButton(
      itemBuilder: (context) => [
        // const PopupMenuItem(
        //   child: Row(
        //     children: [
        //       Icon(Icons.edit),
        //       SizedBox(width: 10,),
        //       Text("Edit title"),
        //     ],
        //   ),
        // ),
        PopupMenuItem(
          onTap: () async => await dbProvider.deleteNote(note.id!),
          child: const Row(
            children: [
              Icon(Icons.delete),
              SizedBox(width: 10,),
              Text("Delete"),
            ],
          ),
        ),
      ],
    );
  }
}
