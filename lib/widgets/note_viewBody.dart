import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/note_list.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            iconshape: Icons.search, title: 'Notes',
          ),
          Expanded(
            child: Notelist(),
          ),
        ],
      ),
    );
  }
}
