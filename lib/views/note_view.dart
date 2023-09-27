import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_floating_button.dart';
import 'package:note_app/widgets/note_view_body.dart';

class Noteview extends StatelessWidget {
  const Noteview({super.key});
  static String id = ' Noteview';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        floatingActionButton: CustomFloatingButton(), body: NoteViewBody());
  }
}
