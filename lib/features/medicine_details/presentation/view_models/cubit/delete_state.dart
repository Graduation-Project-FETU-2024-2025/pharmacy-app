part of 'delete_cubit.dart';

@immutable
sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

final class DeleteLoading extends DeleteState {}

final class DeleteSuccess extends DeleteState {
  final String successMessage;
  DeleteSuccess({required this.successMessage});
}

final class DeleteFailure extends DeleteState {
  final String errorMessage;
  DeleteFailure({required this.errorMessage});
}
