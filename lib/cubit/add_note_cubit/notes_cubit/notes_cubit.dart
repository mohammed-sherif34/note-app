import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchNotes() {
    try {
      var notesbox = Hive.box<NoteModel>(knotebox);
      List<NoteModel> notesList = notesbox.values.toList();

      emit(NotesSuccess(notesList));
    } catch (e) {
      emit(NotesFailure(
        errormsg: 'e.toString()',
      ));
    }
  }
}
