import 'package:pharmacy_app/core/database/api/api_error_model.dart';
import 'package:pharmacy_app/features/all_branches/data/models/pharmacy_branch_model.dart';

sealed class GetBranchesState {}

final class GetBranchesInitial extends GetBranchesState {}

final class GetBranchesLoading extends GetBranchesState {}

final class GetBranchesSuccess extends GetBranchesState {
  final List<PharmacyBranchModel> branches;

  GetBranchesSuccess({required this.branches});
}

final class GetBranchesFailure extends GetBranchesState {
  final ApiErrorModel apiErrorModel;

  GetBranchesFailure({required this.apiErrorModel});
}
