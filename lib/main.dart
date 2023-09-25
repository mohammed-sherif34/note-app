import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/edite_note_view.dart';
import 'package:note_app/views/note_view.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const NoteApp());
  await Hive.openBox(knotebox);
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        EditeNoteView.id: (context) => EditeNoteView(),
        Noteview.id: (context) => Noteview(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Noteview.id,
    );
  }
}
