import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubitCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubitCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) {
    emit(AddNoteCubLoading());
    try {
      var notesbox = Hive.box<NoteModel>(knotebox);
            emit(AddNoteCubSuccess());
      notesbox.add(note);
    } catch (e) {
      AddNoteCubFailure(errorMessage: e.toString());
    }
  }
}
