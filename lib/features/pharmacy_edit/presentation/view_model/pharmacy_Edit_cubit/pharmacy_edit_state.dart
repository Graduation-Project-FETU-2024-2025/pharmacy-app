part of 'pharmacy_edit_cubit.dart';

@immutable
sealed class PharmacyEditState {}

final class PharmacyEditInitial extends PharmacyEditState {}
final class AddBranchInitial extends PharmacyEditState {}

class AddBranchLoading extends PharmacyEditState {}

class AddBranchSuccess extends PharmacyEditState {
  final AddBranchModel branch;
  AddBranchSuccess(this.branch);
}

class AddBranchError extends PharmacyEditState {
  final ApiErrorModel apiErrorModel;
  AddBranchError(this.apiErrorModel);
}

class BranchImagePicked extends PharmacyEditState {
  final File image;
  BranchImagePicked(this.image);
}