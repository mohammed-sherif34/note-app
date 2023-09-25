import 'package:flutter/material.dart';
import 'package:note_app/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/widgets/custom_app_bar.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key});
  static String id = 'EditeNoteView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomAppBar(
              iconshape: Icons.check,
              title: 'Edie Note',
            ),
          ),
          AddNoteBottomSheet(
            title: 'title',
            content: 'content',
            button: false,
          ),
        ],
      ),
    );
  }
}
