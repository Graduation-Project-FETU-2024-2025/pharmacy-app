part of 'get_branch_products_cubit.dart';

@immutable
sealed class GetBranchProductsState {}

final class GetBranchProductsInitial extends GetBranchProductsState {}

final class GetBranchProductsLoading extends GetBranchProductsState {}

final class GetBranchProductsSuccess extends GetBranchProductsState {
  final List<MedicineBranchModel> medicines;
  GetBranchProductsSuccess({required this.medicines});
}

final class GetBranchProductsFailure extends GetBranchProductsState {
  final String erorrMessage;

  GetBranchProductsFailure({required this.erorrMessage});
}

final class GetBranchProductsSelectBranch extends GetBranchProductsState {}
