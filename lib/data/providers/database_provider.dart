import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s5_notes/data/modals/note_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseProvider with ChangeNotifier {
  final Database _database;
  List<NoteModel> _notes = [];
  int? _openedNote;

  DatabaseProvider({required Database database}) : _database = database;

  // provider
  Database get db => _database;
  List<NoteModel> get notes => _notes;
  int? get openedNote => _openedNote;

  //Create path for database
  void close() async {
    await db.close();
  }

  Future<void> deleteNote(int id) async {
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
    if (id == openedNote) {
      _openedNote = null;
    }
    await initAllNotes();
    notifyListeners();
  }

  void changeOpenedNote(int newIndex) {
    _openedNote = newIndex;
    notifyListeners();
  }

  Future initAllNotes() async {
    var resp = await db.query("notes");

    final data = resp.map(
      (e) => NoteModel(
        id: e['id'] as int,
        title: e['title'] as String,
        description: e['description'] as String,
        createdAt: e['created_at'] as String,
        content: e['content'] as String,
      ),
    );

    _notes = data.toList();
    notifyListeners();
    return '';
  }

  Future updateNote(NoteModel note) async {
    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
    await initAllNotes();
    notifyListeners();
  }

  Future addNote(NoteModel note) async {
    await db.insert('notes', note.toMap());
    await initAllNotes();
    notifyListeners();
  }

  Future<String> getNoteContent(int id) async {
    final res = await db.query('notes', where: 'id = ?', whereArgs: [id]);
    return res[0]['content'] as String;
  }
}

class DatabaseGetter {
  final databaseFactory = databaseFactoryFfi;
  late Directory appDocumentsDir;
  late final Database db;
  late String dbPath;

  DatabaseProvider() {
    initDB();
  }

  Future<int> initDB() async {
    appDocumentsDir = await getApplicationDocumentsDirectory();
    dbPath = join(appDocumentsDir.path, "S5Notes", "data.db");
    db = await databaseFactory.openDatabase(
      dbPath,
    );
    return 0;
  }

  //Create path for database
  void close() async {
    await db.close();
  }
}
