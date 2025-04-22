part of 'last_added_cubit.dart';

@immutable
sealed class LastAddedState {}

final class LastAddedInitial extends LastAddedState {}

final class LastAddedLoading extends LastAddedState {}

final class LastAddedSuccess extends LastAddedState {
  final List<LastAddedModel> medicines;
  LastAddedSuccess({required this.medicines});
}

final class LastAddedFailure extends LastAddedState {
  final ApiErrorModel errorModel;
  LastAddedFailure({required this.errorModel});
}
