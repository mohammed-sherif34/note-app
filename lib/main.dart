import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_block_observer.dart';
import 'package:note_app/views/edite_note_view.dart';
import 'package:note_app/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = SimpleBlockObserver();
  await Hive.openBox<NoteModel>(knotebox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>NotesCubit(),
      child: MaterialApp(
        routes: {
          EditeNoteView.id: (context) => const EditeNoteView(),
          Noteview.id: (context) => const Noteview(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
        initialRoute: Noteview.id,
      ),
    );
  }
}
