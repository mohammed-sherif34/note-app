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

// ignore: must_be_immutable
class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
    required this.titleHint,
    required this.contentHint,
    required this.button,
  });

  final String titleHint;
  final String contentHint;
  final bool button;
  String? title, subTitle;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
              widget.title = value!;
            },
            hint: widget.titleHint,
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            onSaved: (value) {
              widget.subTitle = value!;
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
