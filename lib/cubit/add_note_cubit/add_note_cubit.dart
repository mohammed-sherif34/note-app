import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) {
    emit(AddNoteCubLoading());
    try {
      var notesbox = Hive.box<NoteModel>(knotebox);
      notesbox.add(note);
       emit(AddNoteCubSuccess());
    } catch (e) {
      emit(AddNoteCubFailure(errorMessage: e.toString()));
    }
  }
}
