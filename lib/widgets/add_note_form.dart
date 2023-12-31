import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_list.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_filed.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

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
            hint: 'hint',
            maxLines: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFiled(
            onSaved: (value) {
              subTitle = value!;
            },
            hint: 'content',
            maxLines: 5,
          ),
            const SizedBox(
            height: 15,
          ),
          const ColorList(),
            const SizedBox(
            height: 15,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return addNoteFormButton(state, context);
          }),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  CustomButton addNoteFormButton(AddNoteState state, BuildContext context) {
    return CustomButton(
            isloading: state is AddNoteCubLoading ? true : false,
            ontap: () {
              buttonFormAction(context);
            },
          );
  }

  void buttonFormAction(BuildContext context) {
     if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var noteModel = NoteModel(
          title: title!,
          subbtitle: subTitle!,
          date: formatDate(),
          color: Colors.blue.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  String formatDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;
  }
}
