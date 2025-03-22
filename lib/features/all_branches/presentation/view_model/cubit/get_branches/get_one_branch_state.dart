part of 'get_one_branch_cubit.dart';

@immutable
sealed class GetOneBranchState {}

final class GetOneBranchInitial extends GetOneBranchState {}

final class GetOneBranchLoading extends GetOneBranchState {}

final class GetOneBranchSuccess extends GetOneBranchState {
final PharmacyBranchModel branch;

  GetOneBranchSuccess({required this.branch});
}

final class GetOneBranchFailure extends GetOneBranchState {
  final String message;

  GetOneBranchFailure(this.message);
}
