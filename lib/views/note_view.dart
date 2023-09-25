import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_floating_button.dart';
import 'package:note_app/widgets/note_viewBody.dart';

class Noteview extends StatelessWidget {
  const Noteview({super.key});
  static String id = ' Noteview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatingButton(),
        body: const NoteViewBody());
  }
}
