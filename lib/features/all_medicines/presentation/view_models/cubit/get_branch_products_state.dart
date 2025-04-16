part of 'get_branch_products_cubit.dart';

@immutable
sealed class GetBranchProductsState {}

final class GetBranchProductsInitial extends GetBranchProductsState {}

final class GetBranchProductsLoading extends GetBranchProductsState {}

final class GetBranchProductsSuccess extends GetBranchProductsState {
  final List<MedicineBranchModel> medicines;
  GetBranchProductsSuccess({required this.medicines});
}

final class SearchBranchProductsSuccess extends GetBranchProductsState {
  final List<MedicineBranchModel> medicines;
  SearchBranchProductsSuccess({required this.medicines});
}

final class GetBranchProductsFailure extends GetBranchProductsState {
  final ApiErrorModel apiErrorModel;

  GetBranchProductsFailure({required this.apiErrorModel});
}

final class GetBranchProductsSelectBranch extends GetBranchProductsState {}
