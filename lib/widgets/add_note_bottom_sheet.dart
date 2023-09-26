import 'package:flutter/material.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteCubFailure) {
               print('failed ${state.errorMessage}');
            }
            if (state is AddNoteCubSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteCubLoading ? true : false,
              child: AddNoteForm(
                titleHint: titleHint,
                contentHint: contenthint,
                button: button,
              ),
            );
          },
        ),
      ),
    );
  }
}
