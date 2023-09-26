import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
    required this.titleHint,
    required this.contentHint,
    required this.button,
  });

  final String titleHint;
  final String contentHint;
  final bool button;


  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
   String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFiled(
            onSaved: (value) {
              title = value!;
            },
            hint: widget.titleHint,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            onSaved: (value) {
              subTitle = value!;
            },
            hint: widget.contentHint,
            maxLines: 5,
          ),
          const SizedBox(
            height: 50,
          ),
          widget.button == true
              ? CustomButton(
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
