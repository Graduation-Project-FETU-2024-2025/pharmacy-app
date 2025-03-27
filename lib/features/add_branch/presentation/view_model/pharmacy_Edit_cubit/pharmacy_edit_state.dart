part of 'pharmacy_edit_cubit.dart';

@immutable
sealed class PharmacyEditState {}

final class PharmacyEditInitial extends PharmacyEditState {}
final class AddBranchInitial extends PharmacyEditState {}

class AddBranchLoading extends PharmacyEditState {}

class AddBranchSuccess extends PharmacyEditState {
  final AddBranchModelResponse branch;
  AddBranchSuccess(this.branch);
}

class AddBranchFailure extends PharmacyEditState {
  final ApiErrorModel apiErrorModel;
  AddBranchFailure(this.apiErrorModel);
}

class BranchImagePicked extends PharmacyEditState {
  final File image;
  BranchImagePicked(this.image);
}

final class UpdateBranchLoading extends PharmacyEditState {}
final class UpdateBranchSuccess extends PharmacyEditState {}
final class UpdateBranchFailure extends PharmacyEditState {
  final ApiErrorModel apiErrorModel;

  UpdateBranchFailure({required this.apiErrorModel});
}
