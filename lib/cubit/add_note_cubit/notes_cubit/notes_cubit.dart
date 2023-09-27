import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notesList;
  fetchNotes() {
    var notesbox = Hive.box<NoteModel>(knotebox);
    notesList = notesbox.values.toList();
    emit(NotesSuccess());
  }
}
