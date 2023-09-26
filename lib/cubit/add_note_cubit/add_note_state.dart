part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteCubitInitial extends AddNoteState {}

final class AddNoteCubLoading extends AddNoteState {}

final class AddNoteCubSuccess extends AddNoteState {}

final class AddNoteCubFailure extends AddNoteState {
  final String errorMessage;

  AddNoteCubFailure({required this.errorMessage});
}
