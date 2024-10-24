import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/pages/notes_page.dart';
import 'package:s5_notes/presentation/widgets/desktop/titlebar.dart';

class DesktopPortraitLayout extends StatelessWidget {
  const DesktopPortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final dbProvider = Provider.of<DatabaseProvider>(context);
    return Column(
      children: [
        TitleBar(
          logo: Icon(
            Icons.flash_on_rounded,
            color: themeData.colorScheme.primary,
          ),
          title: "S5 Notes",
        ),
        Expanded(
          child: NotesPage(
            onNoteSelected: dbProvider.changeOpenedNote,
          ),
        ),
      ],
    );
  }
}
