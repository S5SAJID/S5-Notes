import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/layouts/desktop_layout.dart';
import 'package:s5_notes/presentation/layouts/desktop_portrait_layout.dart';
import 'package:s5_notes/presentation/pages/notes_page.dart';
import 'package:s5_notes/utils/utils.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {

          // Portrait Layout
          if (constraints.maxWidth < 700) {
            // Desktop Portrait Layout
            if (Utils.isDesktop) {
              return const DesktopPortraitLayout();
            } else {
              // Mobile Layout
              return NotesPage(
                onNoteSelected: dbProvider.changeOpenedNote,
              );
            }
          }
          
          // Desktop layout
          else {
            return const DesktopLayout();
          }
        },
      ),
    );
  }
}
