import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet(
      {super.key,
      required this.title,
      required this.content,
      required this.button});
  final String title;
  final String content;
  final bool button;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFiled(
            hint: title,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            hint: content,
            maxLines: 5,
          ),
          const SizedBox(
            height: 50,
          ),
          button == true ? const CustomButton() : const SizedBox()
        ],
      ),
    );
  }
}
