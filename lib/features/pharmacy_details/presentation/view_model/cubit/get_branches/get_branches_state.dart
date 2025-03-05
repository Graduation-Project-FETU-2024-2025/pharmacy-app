part of 'get_branches_cubit.dart';

@immutable
sealed class GetBranchesState {}

final class GetBranchesInitial extends GetBranchesState {}

final class GetBranchesLoading extends GetBranchesState {}

final class GetBranchesSuccess extends GetBranchesState {

}

final class GetBranchesFailure extends GetBranchesState {
  final String message;

  GetBranchesFailure(this.message);
}
