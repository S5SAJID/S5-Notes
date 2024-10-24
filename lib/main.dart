import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:s5_notes/data/providers/database_provider.dart';
import 'package:s5_notes/presentation/pages/index_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:s5_notes/utils/utils.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final appDocumentsDir = await getApplicationDocumentsDirectory();
  final dbPath = join(appDocumentsDir.path, "S5Notes", "data.db");
  final db = await databaseFactory.openDatabase(
    dbPath,
  );

  // for desktops
  if (Utils.isDesktop) {
    doWhenWindowReady(() {
      const initialSize = Size(1100, 800);
      appWindow.minSize = const Size(800, 600);
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.title = "S5 Notes";
      appWindow.show();
    });
  } 
  runApp(MyApp(
    database: db,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.database});
  final Database database;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(database: database),
        )
      ],
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          title: 'S5Notes',
          theme: ThemeData(
              colorScheme: lightDynamic,
              useMaterial3: true,
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                    color: Theme.of(context).hintColor.withOpacity(.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(width: .5, color: Colors.black26),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(width: .5, color: Colors.black26),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(width: 1),
                ),
              )),
          home: const IndexPage(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
