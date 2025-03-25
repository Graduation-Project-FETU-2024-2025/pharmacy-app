
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';

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
