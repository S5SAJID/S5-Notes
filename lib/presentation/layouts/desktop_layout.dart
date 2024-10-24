import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/pages/note_editor_page.dart';
import 'package:s5_notes/presentation/pages/notes_page.dart';
import 'package:s5_notes/presentation/pages/welcome_page.dart';
import 'package:s5_notes/presentation/widgets/desktop/titlebar.dart';


class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final dbProvider = Provider.of<DatabaseProvider>(context);
    return Column(
      children: [
        TitleBar(
          logo: Image.asset('assets/icons/no-bg-icon.png'),
          title: "S5 Notes",
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 320,
                child: NotesPage(
                  currentNote: dbProvider.openedNote,
                  onNoteSelected: dbProvider.changeOpenedNote,
                ),
              ),
              VerticalDivider(
                width: .5,
                thickness: 1,
                color: themeData.dividerColor.withOpacity(.4),
              ),
              Expanded(
                child: dbProvider.openedNote == null
                    ? const WelcomePage()
                    : NoteEditorPage(
                        currentNote: dbProvider.openedNote!,
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
