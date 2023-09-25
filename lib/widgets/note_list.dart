import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_item.dart';

class Notelist extends StatelessWidget {
  const Notelist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const NoteItem();
        });
  }
}
