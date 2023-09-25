part of 'add_note_cubit_cubit.dart';

@immutable
sealed class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}

final class AddNoteCubLoading extends AddNoteCubitState {}

final class AddNoteCubSuccess extends AddNoteCubitState {}

final class AddNoteCubFailure extends AddNoteCubitState {
  final String errorMessage;

  AddNoteCubFailure({required this.errorMessage});
}
