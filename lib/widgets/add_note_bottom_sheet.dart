import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubit/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:note_app/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
      ],
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteCubFailure) {
            if (kDebugMode) {
              print('failed ${state.errorMessage}');
            }
          }
          if (state is AddNoteCubSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteCubLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
