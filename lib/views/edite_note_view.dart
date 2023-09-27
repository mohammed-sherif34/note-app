import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class EditeNoteView extends StatefulWidget {
  const EditeNoteView({super.key});
  static String id = 'EditeNoteView';

  @override
  State<EditeNoteView> createState() => _EditeNoteViewState();
}

class _EditeNoteViewState extends State<EditeNoteView> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    var note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomAppBar(
                onTap: () {
                  note.title = title ?? note.title;
                  note.subbtitle = subtitle ?? note.subbtitle;
                  note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  // setState(() {});
                  Navigator.pop(context);
                },
                iconshape: Icons.check,
                title: 'Edie Note',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFiled(
                hint: note.title,
                maxLines: 1,
                onChanged: (value) {
                  title = value;
                }),
            const SizedBox(
              height: 15,
            ),
            CustomTextFiled(
              hint: note.subbtitle,
              maxLines: 5,
              onChanged: (value) {
                subtitle = value;
              },
            )
          ],
        ),
      ),
    );
  }
}
