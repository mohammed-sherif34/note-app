import 'package:flutter/material.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
      ],
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
          return AbsorbPointer(
            absorbing: state is AddNoteCubLoading?true:false,
            child: Padding(
              padding:  EdgeInsets.only(left:16.0,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: AddNoteForm(
                  titleHint: titleHint,
                  contentHint: contenthint,
                  button: button,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
