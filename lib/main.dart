import 'package:flutter/material.dart';
import 'package:note_app/views/edite_note_view.dart';
import 'package:note_app/views/note_view.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      EditeNoteView.id:(context) => EditeNoteView(),
      Noteview.id:(context) => Noteview(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Noteview.id,
    );
  }
}
