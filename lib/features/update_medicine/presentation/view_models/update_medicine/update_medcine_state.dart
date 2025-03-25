part of 'update_medcine_cubit.dart';

@immutable
sealed class UpdateMedcineState {}

final class UpdateMedcineInitial extends UpdateMedcineState {}

final class UpdateMedcineLoading extends UpdateMedcineState {}

final class UpdateMedcineSuccess extends UpdateMedcineState {}

final class UpdateMedcineFailure extends UpdateMedcineState {
  final String errorMessage;
  UpdateMedcineFailure({
    required this.errorMessage,
  });
}
