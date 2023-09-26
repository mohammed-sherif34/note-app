import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
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
              ? BlocBuilder<AddNoteCubit, AddNoteState>(
                  builder: (context, state) {
                  return CustomButton(
                    isloading: state is AddNoteCubLoading ? true : false,
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = NoteModel(
                            title: title!,
                            subbtitle: subTitle!,
                            date: DateTime.now().toString(),
                            color: Colors.brown.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                })
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
