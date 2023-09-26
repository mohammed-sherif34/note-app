import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet(
      {super.key,
      required this.titleHint,
      required this.contenthint,
      required this.button});
  final String titleHint;
  final String contenthint;
  final bool button;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AddNoteForm(
        titleHint: titleHint,
        contentHint: contenthint,
        button: button,
      ),
    );
  }
}
